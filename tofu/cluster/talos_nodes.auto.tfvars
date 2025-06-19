talos_nodes = {
  "talos10011" = {
    host_node     = "pve01"
    machine_type  = "controlplane"
    ip            = "10.0.100.11/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:01"
    vm_id         = 2091
    cpu           = 4
    ram           = 16384
    order         = 91
    #igpu          = true
    #update        = true
  }
  "talos10012" = {
    host_node     = "pve02"
    machine_type  = "controlplane"
    ip            = "10.0.100.12/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:02"
    vm_id         = 2092
    cpu           = 4
    ram           = 16384
    order         = 92
    #igpu          = true
    #update        = true
  }
  "talos10013" = {
    host_node     = "pve03"
    machine_type  = "controlplane"
    ip            = "10.0.100.13/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:03"
    vm_id         = 2093
    cpu           = 4
    ram           = 16384
    order         = 93
    #igpu          = true
    #update        = true
  }

  "talos10014" = {
    host_node     = "pve04"
    machine_type  = "worker"
    ip            = "10.0.100.14/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:04"
    vm_id         = 2094
    cpu           = 8
    ram           = 16384
    order         = 94
    igpu          = true
    #update        = true
  }
  "talos10015" = {
    host_node     = "pve05"
    machine_type  = "worker"
    ip            = "10.0.100.15/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:05"
    vm_id         = 2095
    cpu           = 8
    ram           = 16384
    order         = 95
    igpu          = true
    #update        = true
  }
  "talos10016" = {
    host_node     = "pve01"
    machine_type  = "worker"
    ip            = "10.0.100.16/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:06"
    vm_id         = 2096
    cpu           = 8
    ram           = 16384
    order         = 96
    igpu          = true
    #update        = true
  }
  "talos10017" = {
    host_node     = "pve02"
    machine_type  = "worker"
    ip            = "10.0.100.17/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:07"
    vm_id         = 2097
    cpu           = 8
    ram           = 16384
    order         = 97
    igpu          = true
    #update        = true
  }
  "talos10018" = {
    host_node     = "pve03"
    machine_type  = "worker"
    ip            = "10.0.100.18/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:08"
    vm_id         = 2098
    cpu           = 8
    ram           = 16384
    order         = 98
    igpu          = true
    #update        = true
  }

  "talos10019" = {
    host_node     = "pve64"
    machine_type  = "dgpuworker"
    ip            = "10.0.100.19/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:09"
    vm_id         = 2099
    cpu           = 8
    ram           = 16384
    order         = 99
    #update        = true
  }
}
