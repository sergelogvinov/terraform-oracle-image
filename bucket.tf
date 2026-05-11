
resource "random_id" "bucket" {
  byte_length = 8
}

data "oci_objectstorage_namespace" "namespace" {
  compartment_id = var.compartment
}

resource "oci_objectstorage_bucket" "images" {
  compartment_id = var.compartment
  namespace      = data.oci_objectstorage_namespace.namespace.namespace
  name           = "images-${random_id.bucket.hex}"
  access_type    = "NoPublicAccess"
  auto_tiering   = "Disabled"
  versioning     = "Enabled"
}
