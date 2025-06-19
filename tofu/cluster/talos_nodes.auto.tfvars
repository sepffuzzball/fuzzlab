talos_nodes = {
  "talos01" = {
    host_node     = "pve01"
    machine_type  = "controlplane"
    ip            = "10.0.2.91/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:01"
    vm_id         = 2091
    cpu           = 4
    ram           = 16384
    order         = 91
    #igpu          = true
    #update        = true
  }
  "talos02" = {
    host_node     = "pve02"
    machine_type  = "controlplane"
    ip            = "10.0.2.92/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:02"
    vm_id         = 2092
    cpu           = 4
    ram           = 16384
    order         = 92
    #igpu          = true
    #update        = true
  }
  "talos03" = {
    host_node     = "pve03"
    machine_type  = "controlplane"
    ip            = "10.0.2.93/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:03"
    vm_id         = 2093
    cpu           = 4
    ram           = 16384
    order         = 93
    #igpu          = true
    #update        = true
  }

  "talos04" = {
    host_node     = "pve04"
    machine_type  = "worker"
    ip            = "10.0.2.94/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:04"
    vm_id         = 2094
    cpu           = 8
    ram           = 16384
    order         = 94
    igpu          = true
    #update        = true
  }
  "talos05" = {
    host_node     = "pve05"
    machine_type  = "worker"
    ip            = "10.0.2.95/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:05"
    vm_id         = 2095
    cpu           = 8
    ram           = 16384
    order         = 95
    igpu          = true
    #update        = true
  }
  "talos06" = {
    host_node     = "pve01"
    machine_type  = "worker"
    ip            = "10.0.2.96/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:06"
    vm_id         = 2096
    cpu           = 8
    ram           = 16384
    order         = 96
    igpu          = true
    #update        = true
  }
  "talos07" = {
    host_node     = "pve02"
    machine_type  = "worker"
    ip            = "10.0.2.97/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:07"
    vm_id         = 2097
    cpu           = 8
    ram           = 16384
    order         = 97
    igpu          = true
    #update        = true
  }
  "talos08" = {
    host_node     = "pve03"
    machine_type  = "worker"
    ip            = "10.0.2.98/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:08"
    vm_id         = 2098
    cpu           = 8
    ram           = 16384
    order         = 98
    igpu          = true
    #update        = true
  }

  "talos09" = {
    host_node     = "pve64"
    machine_type  = "dgpuworker"
    ip            = "10.0.2.99/22"
    dns           = ["10.0.1.1"]
    mac_address   = "BC:24:11:2E:C8:09"
    vm_id         = 2099
    cpu           = 8
    ram           = 16384
    order         = 99
    #update        = true
  }
}
