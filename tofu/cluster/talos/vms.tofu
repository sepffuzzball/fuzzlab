resource "proxmox_virtual_environment_pool" "rancher" {
    pool_id = "Rancher"
    comment = "Pool for any rancher/k3s stuff"
}

locals {
  #cp_nodes  = { for k, v in var.nodes : k => v if v.machine_type != "dgpuworker" }
  #gpu_nodes = { for k, v in var.nodes : k => v if v.machine_type == "dgpuworker" }

  # merge them so we can iterate the whole fleet in one go
  #all_nodes = merge(local.cp_nodes, local.gpu_nodes)

  # descriptions & tags in look-ups so we don’t repeat ternaries everywhere
  desc_by_type = {
    controlplane = "Talos Control Plane"
    worker       = "Talos Worker"
    dgpuworker   = "Talos GPU Worker"
  }

  tags_by_type = {
    controlplane = ["k8s", "control-plane"]
    worker       = ["k8s", "worker"]
    dgpuworker   = ["k8s", "worker", "gpu"]
  }
}

resource "proxmox_virtual_environment_vm" "this" {

  for_each = var.nodes

  vm_id       = each.value.vm_id
  name        = each.key
  node_name   = each.value.host_node
  description = local.desc_by_type[each.value.machine_type]
  tags        = local.tags_by_type [each.value.machine_type]

  on_boot       = true
  machine       = "q35"
  scsi_hardware = "virtio-scsi-single"
  bios          = "seabios"

  operating_system { type = "l26" }

  cpu {
    cores = each.value.machine_type == "controlplane" ? 4 : 8
    type  = "host"
  }

  memory {
    dedicated = each.value.ram
    floating  = each.value.ram
  }

  agent   { enabled = true }

  startup {
        order       = each.value.order
        up_delay    = "60"
        down_delay  = "60"
    }

  vga {
    memory = 32
    type = "qxl"
  }

  #####################################################
  #  Disk image – choose Intel vs. NVIDIA build here  #
  #####################################################
  disk {
    size          = 32
    datastore_id  = "ceph-stor"
    interface     = "scsi0"
    iothread      = true
    cache         = "writethrough"
    discard       = "on"
    file_format   = "raw"

    file_id = each.value.machine_type == "dgpuworker" ? proxmox_virtual_environment_download_file.this-nvidia[
          "${each.value.host_node}_${each.value.update == true ? local.update_image_nvidia_id : local.image_nvidia_id}"
        ].id : proxmox_virtual_environment_download_file.this-intel[
          "${each.value.host_node}_${each.value.update == true ? local.update_image_intel_id  : local.image_intel_id}"
        ].id
  }

  #####################################################
  #  Cloud-init / Talos init                          #
  #####################################################
  initialization {
    datastore_id = "ceph-stor"

    dns {
      servers = each.value.dns
    }

    ip_config {
      ipv4 {
        address = each.value.ip
        gateway = var.cluster.gateway
      }

      ipv6 {
        address = each.value.ipv6
        gateway = var.cluster.gatewayv6
      }
    }
  }

  network_device {
    bridge      = "vmbr1"
    mac_address = each.value.mac_address
    vlan_id     = 100
  }

  #############################################
  #  PASSTHROUGH LOGIC                         #
  #  * dgpuworker → always attach dGPU (01:00) #
  #  * others with igpu=true → attach iGPU     #
  #############################################


  dynamic "hostpci" {
    for_each = each.value.machine_type == "dgpuworker" ? [
        { id = "0000:01:00.0" }                # dGPU
      ] : each.value.igpu ? [
        { id = "0000:00:02.0" }                # iGPU
      ] : []

    content {
      device = "hostpci0"
      id     = hostpci.value.id
      pcie   = true
      rombar = true
      xvga   = false
    }
  }

  pool_id = proxmox_virtual_environment_pool.rancher.id
}
