variable "instance_network_external_id" {
  type        = string
}

variable "instance_network_external_name" {
  type    = string
}

variable "instance_name" {
  type    = string
}

variable "instance_image_id" {
  type    = string
  default = "a86e7c97-8a0e-4f5b-847c-9b78f9f4b8f2"
}

variable "instance_flavor_name" {
  type    = string
  default = "a1-ram2-disk20-perf1"
}

variable "instance_security_groups" {
  type    = list(any)
  default = ["default"]
}

variable "instance_keypair" {
  type    = string
}

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}

variable "instance_network_internal" {
  type    = string
}