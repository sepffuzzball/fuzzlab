locals {
  nvidiaversion      = var.image.version
  schematic_nvidia = file("${path.root}/${var.image.schematic_nvidia_path}")
  schematic_nvidia_id = jsondecode(data.http.schematic_nvidia_id.response_body)["id"]

  update_nvidia_version = coalesce(var.image.update_version, var.image.version)
  update_schematic_nvidia_path = coalesce(var.image.update_schematic_nvidia_path, var.image.schematic_nvidia_path)
  update_schematic_nvidia = file("${path.root}/${local.update_schematic_nvidia_path}")
  update_schematic_nvidia_id = jsondecode(data.http.updated_nvidia_schematic_id.response_body)["id"]

  image_nvidia_id        = "${local.schematic_nvidia_id}_${local.nvidiaversion}"
  update_image_nvidia_id = "${local.update_schematic_nvidia_id}_${local.update_nvidia_version}"

  # Comment the above 2 lines and un-comment the below 2 lines to use the provider schematic ID instead of the HTTP one
  # ref - https://github.com/vehagn/homelab/issues/106
  # image_nvidia_id = "${talos_image_factory_schematic.this-nvidia.id}_${local.version}"
  # update_image_nvidia_id = "${talos_image_factory_schematic.updated_nvidia.id}_${local.update_nvidia_version}"
}

data "http" "schematic_nvidia_id" {
  url          = "${var.image.factory_url}/schematics"
  method       = "POST"
  request_body = local.schematic_nvidia
}

data "http" "updated_nvidia_schematic_id" {
  url          = "${var.image.factory_url}/schematics"
  method       = "POST"
  request_body = local.update_schematic_nvidia
}

resource "talos_image_factory_schematic" "this-nvidia" {
  schematic = local.schematic_nvidia
}

resource "talos_image_factory_schematic" "updated-nvidia" {
  schematic = local.update_schematic_nvidia
}

# Note the ellipsis (...) after the for-loop. This collects values with same keys into a list.
# The key is purposefully made up of the values (image_nvidia_id contains both schematic id and version),
# since all values under a key therefore are the same, we can simply select the first element of the value list.
# Improvements are welcome!
resource "proxmox_virtual_environment_download_file" "this-nvidia" {
  for_each = {
    for k, v in var.nodes :
    "${v.host_node}_${v.update == true ? local.update_image_nvidia_id : local.image_nvidia_id}" => {
      host_node = v.host_node
      schematic = v.update == true ? talos_image_factory_schematic.updated-nvidia.id : talos_image_factory_schematic.this-nvidia.id
      nvidiaversion   = v.update == true ? local.update_nvidia_version : local.nvidiaversion
    }...
  }

  node_name    = each.value[0].host_node
  content_type = "iso"
  datastore_id = var.image.proxmox_datastore

  file_name               = "talos-${each.value[0].schematic}-${each.value[0].nvidiaversion}-${var.image.platform}-${var.image.arch}.img"
  url                     = "${var.image.factory_url}/image/${each.value[0].schematic}/${each.value[0].nvidiaversion}/${var.image.platform}-${var.image.arch}.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}
