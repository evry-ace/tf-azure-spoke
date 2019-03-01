variable "spoke_name" {
  description = "Name of the spoke"
}

variable "spoke_location" {
  default = "West Europe"
}

variable "spoke_address_space" {
  default = "10.201.32.0/22"
}
