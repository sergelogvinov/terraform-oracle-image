
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

resource "oci_objectstorage_object_lifecycle_policy" "images" {
  namespace = data.oci_objectstorage_namespace.namespace.namespace
  bucket    = oci_objectstorage_bucket.images.name

  rules {
    action      = "DELETE"
    is_enabled  = "true"
    name        = "old-versions"
    time_amount = "90"
    time_unit   = "DAYS"
    target      = "previous-object-versions"
  }
  rules {
    action      = "ABORT"
    is_enabled  = "true"
    name        = "multipart"
    time_amount = "2"
    time_unit   = "DAYS"
    target      = "multipart-uploads"
  }
}
