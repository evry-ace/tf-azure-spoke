resource "azurerm_resource_group" "spoke" {
  name     = "${var.spoke_name}-spoke"
  location = "${var.spoke_location}"
}

resource "azurerm_virtual_network" "spoke" {
  name                = "${var.spoke_name}-spoke"
  resource_group_name = "${azurerm_resource_group.spoke.name}"
  location            = "${var.spoke_location}"

  address_space = [
    "${var.spoke_address_space}",
  ]
}

resource "azurerm_subnet" "spoke-subnet" {
  name                 = "${var.spoke_name}"
  resource_group_name = "${azurerm_resource_group.spoke.name}"
  virtual_network_name = "${azurerm_virtual_network.spoke.name}"
  address_prefix       = "${var.spoke_address_space}"
}

output "spoke_subnet_id" {
  depends_on = [
    "${azurerm_resource_group.spoke}",
    "${azurerm_virtual_network.spoke}",
  ]

  value = "${azurerm_virtual_network.spoke.id}"
}
