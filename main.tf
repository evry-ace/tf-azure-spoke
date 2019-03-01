resource "azurerm_resource_group" "spoke" {
  name     = "${var.spoke_resourcegroup_name}"
  location = "${var.spoke_location}"
}

resource "azurerm_virtual_network" "spoke" {
  name                = "${var.environment}-spoke"
  resource_group_name = "${azurerm_resource_group.spoke.name}"
  location            = "${var.spoke_location}"

  address_space = [
    "${var.spoke_address_space}",
  ]
}
