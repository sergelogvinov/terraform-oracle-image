
resource "oci_objectstorage_object" "talos" {
  for_each = toset(var.talos_arch)

  bucket    = oci_objectstorage_bucket.images.name
  namespace = data.oci_objectstorage_namespace.namespace.namespace
  object    = "talos-${lower(each.key)}.oci"
  source    = "oracle-${lower(each.key)}.oci"
  # content_md5 = filemd5("oracle-${lower(each.key)}.oci")
}

resource "oci_core_image" "talos" {
  for_each       = toset(var.talos_arch)
  compartment_id = var.compartment
  display_name   = "Talos-${lower(each.key)}"
  defined_tags   = var.tags
  freeform_tags  = { "OS" : "Talos", "Arch" : lower(each.key) }
  launch_mode    = "PARAVIRTUALIZED"

  image_source_details {
    source_type    = "objectStorageTuple"
    namespace_name = data.oci_objectstorage_namespace.namespace.namespace
    bucket_name    = oci_objectstorage_bucket.images.name
    object_name    = oci_objectstorage_object.talos[each.key].object

    operating_system         = "Talos"
    operating_system_version = var.talos_version
    source_image_type        = "QCOW2"
  }

  lifecycle {
    ignore_changes = [
      defined_tags,
    ]
    replace_triggered_by = [oci_objectstorage_object.talos[each.key].content_md5]
  }

  timeouts {
    create = "30m"
  }
}
