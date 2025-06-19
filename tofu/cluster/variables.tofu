variable "proxmox" {
  description = "Proxmox provider configuration"
  type = object({
    name         = string
    endpoint     = string
    insecure     = bool
    username     = string
  })
}

variable "proxmox_nodes" {
  type = map(any)
}

variable "talos_image" {
  description = "Talos image configuration"
  type = object({
    factory_url           = optional(string, "https://factory.talos.dev")
    version               = string
    schematic_intel_path  = string
    schematic_nvidia_path = string
    update_version        = optional(string)
    update_schematic_intel_path = optional(string)
    update_schematic_nvidia_path = optional(string)
    arch                  = optional(string, "amd64")
    platform              = optional(string, "nocloud")
    proxmox_datastore     = optional(string, "local")
  })
}

variable "talos_cluster_config" {
  description = "Talos cluster configuration"
  type = object({
    name                         = string
    vip                          = optional(string)
    gateway                      = string
    gatewayv6                    = string
    subnet_mask                  = optional(string, "22")
    talos_machine_config_version = optional(string)
    proxmox_cluster              = string
    kubernetes_version           = string
    gateway_api_version          = string
    extra_manifests              = optional(list(string), [])
    kubelet                      = optional(string)
    api_server                   = optional(string)
    #cilium = object({
    #  bootstrap_manifest_path = string
    #  values_file_path        = string
    #})
  })
}


variable "talos_nodes" {
  type = map(
    object({
      host_node     = string
      machine_type  = string
      ip            = string
      ipv6          = string
      dns           = optional(list(string))
      mac_address   = string
      vm_id         = number
      cpu           = number
      ram           = number
      order         = number
      update        = optional(bool, false)
      igpu          = optional(bool, false)
    })
  )
  validation {
    // @formatter:off
    condition     = length([for n in var.talos_nodes : n if contains(["controlplane", "worker", "dgpuworker"], n.machine_type)]) == length(var.talos_nodes)
    error_message = "Node machine_type must be either 'controlplane' or 'worker'."
    // @formatter:on
  }
}

locals {
    ssh_keys = tomap(
        {
            for k in yamldecode(data.sops_file.pm-sshkeys-secret.raw).keys :
            k.sshkey => k
        }
    )


}
