variable "image" {
  description = "Talos image configuration"
  type = object({
    factory_url           = optional(string, "https://factory.talos.dev")
    schematic_intel_path  = string
    schematic_nvidia_path = string
    version               = string
    update_schematic_intel_path = optional(string)
    update_schematic_nvidia_path = optional(string)
    update_version        = optional(string)
    arch                  = optional(string, "amd64")
    platform              = optional(string, "nocloud")
    proxmox_datastore     = optional(string, "local")
  })
}

variable "cluster" {
  description = "Cluster configuration"
  type = object({
    name                         = string
    vip                          = optional(string)
    gateway                      = string
    subnet_mask                  = optional(string, "24")
    talos_machine_config_version = optional(string)
    proxmox_cluster              = string
    kubernetes_version           = string
    gateway_api_version          = string
    extra_manifests              = optional(list(string))
    kubelet                      = optional(string)
    api_server                   = optional(string)
    #cilium = object({
    #  bootstrap_manifest_path = string
    #  values_file_path        = string
    #})
  })
}

variable "proxmox_nodes" {
  type = map(any)
}

variable "nodes" {
  description = "Configuration for cluster nodes"
  type = map(
    object({
      host_node     = string
      machine_type  = string
      ip            = string
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
}

variable "domain" {
    description = "Search domain"
}

variable "dns" {
    description = "DNS search providers"
}

variable "gateway" {
    description = "Internet gateway"
}
