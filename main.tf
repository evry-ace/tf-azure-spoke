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

data "azurerm_virtual_network" "hub-net" {
  name                = "${var.hub_vnet_name}"
  resource_group_name = "${var.hub_resourcegroup_name}"
}

resource "azurerm_virtual_network_peering" "spoke-to-hub" {
  name                         = "spoke-${var.environment}-to-hub"
  resource_group_name          = "${var.spoke_resourcegroup_name}"
  virtual_network_name         = "${azurerm_virtual_network.spoke.name}"
  remote_virtual_network_id    = "${data.azurerm_virtual_network.hub-net.id}"
  allow_virtual_network_access = true
  allow_gateway_transit        = false
  allow_forwarded_traffic      = true
}
