
variable "compartment" {}

variable "region" {
  description = "The OCI region where resources will be created"
  type        = string
}

variable "talos_version" {
  description = "Version of Talos of template to download"
  type        = string
  default     = "v1.12.7"
}

variable "talos_factory_hash" {
  description = "Hash of the Talos factory image to download"
  type        = string
  default     = "376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba"
}

variable "talos_image_name" {
  description = "Name of the Talos image"
  type        = string
  default     = "talos"
}

variable "talos_arch" {
  description = "The Talos architecture list"
  type        = list(string)
  default     = ["amd64", "arm64"]
}

variable "tags" {
  description = "Defined tags to apply to created resources"
  type        = map(string)
  default = {
    # "Kubernetes.Environment" = "Production"
  }
}
