proxmox = {
  name         = "pve64"
  endpoint     = "https://10.0.1.64:8006"
  insecure     = true
  username     = "root"
}

proxmox_nodes = {
  pve01 = {
    name = "pve01"
  }
  pve02 = {
    name = "pve02"
  }
  pve03 = {
    name = "pve03"
  }
  pve04 = {
    name = "pve04"
  }
  pve05 = {
    name = "pve05"
  }
  pve64 = {
    name = "pve64"
  }

}
