terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.2"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.8.1"
    }
    sops = {
      source = "carlpett/sops"
      version = "~> 1.0"
    }
  }
}

provider "sops" {}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  insecure = var.proxmox.insecure
  username = "root@pam"
  password = data.sops_file.pm-password-secret.data["password"]
  tmp_dir = "/var/tmp"
  ssh {
    agent    = true
    username = var.proxmox.username
    password  = data.sops_file.pm-password-secret.data["password"]
  }
}
