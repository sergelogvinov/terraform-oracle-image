# Terraform module to manage Talos images in Oracle Cloud Infrastructure (OCI)

## Usage Example

```hcl
module "talos_image" {
  source = "github.com/sergelogvinov/terraform-oracle-image"

  compartment = local.compartment_id
  region      = local.region

  talos_version = "v1.12.7"
  talos_factory_hash = "376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba"
}
```

Common variables to override:

- `talos_version` - Version of Talos to download
- `talos_factory_hash` - Hash of the Talos factory image to download
   - `376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba` - customization: {}
   - `14e9b0100f05654bedf19b92313cdc224cbff52879193d24f3741f1da4a3cbb1` - customization: siderolabs/binfmt-misc

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 8.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 8.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_image.talos](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_image) | resource |
| [oci_objectstorage_bucket.images](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [oci_objectstorage_object.talos](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_object) | resource |
| [random_id.bucket](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [oci_objectstorage_namespace.namespace](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment"></a> [compartment](#input\_compartment) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The OCI region where resources will be created | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Defined tags to apply to created resources | `map(string)` | `{}` | no |
| <a name="input_talos_arch"></a> [talos\_arch](#input\_talos\_arch) | The Talos architecture list | `list(string)` | <pre>[<br/>  "amd64",<br/>  "arm64"<br/>]</pre> | no |
| <a name="input_talos_factory_hash"></a> [talos\_factory\_hash](#input\_talos\_factory\_hash) | Hash of the Talos factory image to download | `string` | `"376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba"` | no |
| <a name="input_talos_image_name"></a> [talos\_image\_name](#input\_talos\_image\_name) | Name of the Talos image | `string` | `"talos"` | no |
| <a name="input_talos_version"></a> [talos\_version](#input\_talos\_version) | Version of Talos of template to download | `string` | `"v1.12.7"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->