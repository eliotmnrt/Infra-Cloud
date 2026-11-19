variable "network_external_id" {
  description = "The ID of the external network."
  type        = string
  default     = "34a684b8-2889-4950-b08e-c33b3954a307"
}

variable "network_external_name" {
  type    = string
  default = "ext-floating1"
}

variable "network_internal_dev" {
  type    = string
  default = "internal_dev"
}

variable "network_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "ssh_public_key_default_user" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVv1OUIU5g2f9gvKf0LHtI8aENEza8L//M6fhMFlgiQ eliot@DESKTOP-JV7M8IB"
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

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}