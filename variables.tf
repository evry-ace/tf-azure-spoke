variable "hub_resourcegroup_name" {
  default = "hub"
}

variable "hub_vnet_name" {
  default = "hub"
}

variable "spoke_resourcegroup_name" {
  default = "ace-test-spoke"
}

variable "spoke_location" {
  default = "West Europe"
}

variable "spoke_address_space" {
  default = "10.201.32.0/22"
}

variable "environment" {
  description = "A name for the environment"
  default     = "dev"
}
