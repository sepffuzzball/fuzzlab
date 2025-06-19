locals {
  intelversion      = var.image.version
  schematic_intel = file("${path.root}/${var.image.schematic_intel_path}")
  schematic_intel_id = jsondecode(data.http.schematic_intel_id.response_body)["id"]

  update_intel_version = coalesce(var.image.update_version, var.image.version)
  update_schematic_intel_path = coalesce(var.image.update_schematic_intel_path, var.image.schematic_intel_path)
  update_schematic_intel = file("${path.root}/${local.update_schematic_intel_path}")
  update_schematic_intel_id = jsondecode(data.http.updated_intel_schematic_id.response_body)["id"]

  image_intel_id        = "${local.schematic_intel_id}_${local.intelversion}"
  update_image_intel_id = "${local.update_schematic_intel_id}_${local.update_intel_version}"

  # Comment the above 2 lines and un-comment the below 2 lines to use the provider schematic ID instead of the HTTP one
  # ref - https://github.com/vehagn/homelab/issues/106
  # image_intel_id = "${talos_image_factory_schematic.this-intel.id}_${local.version}"
  # update_image_intel_id = "${talos_image_factory_schematic.updated-intel.id}_${local.update_intel_version}"
}

data "http" "schematic_intel_id" {
  url          = "${var.image.factory_url}/schematics"
  method       = "POST"
  request_body = local.schematic_intel
}

data "http" "updated_intel_schematic_id" {
  url          = "${var.image.factory_url}/schematics"
  method       = "POST"
  request_body = local.update_schematic_intel
}

resource "talos_image_factory_schematic" "this-intel" {
  schematic = local.schematic_intel
}

resource "talos_image_factory_schematic" "updated-intel" {
  schematic = local.update_schematic_intel
}

# Note the ellipsis (...) after the for-loop. This collects values with same keys into a list.
# The key is purposefully made up of the values (image_intel_id contains both schematic id and version),
# since all values under a key therefore are the same, we can simply select the first element of the value list.
# Improvements are welcome!
resource "proxmox_virtual_environment_download_file" "this-intel" {
  for_each = {
    for k, v in var.nodes :
    "${v.host_node}_${v.update == true ? local.update_image_intel_id : local.image_intel_id}" => {
      host_node = v.host_node
      schematic = v.update == true ? talos_image_factory_schematic.updated-intel.id : talos_image_factory_schematic.this-intel.id
      intelversion   = v.update == true ? local.update_intel_version : local.intelversion
    }...
  }

  node_name    = each.value[0].host_node
  content_type = "iso"
  datastore_id = var.image.proxmox_datastore

  file_name               = "talos-${each.value[0].schematic}-${each.value[0].intelversion}-${var.image.platform}-${var.image.arch}.img"
  url                     = "${var.image.factory_url}/image/${each.value[0].schematic}/${each.value[0].intelversion}/${var.image.platform}-${var.image.arch}.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}
