module "talos" {
  source = "./talos"

  providers = {
    proxmox = proxmox
  }

  nodes = var.talos_nodes
  image   = var.talos_image
  cluster = var.talos_cluster_config
  proxmox_nodes = var.proxmox_nodes
}
