
data  "azurerm_resource_group" "resource_group1" {
  name     = "VB_RG1"
      
    }

data  "azurerm_resource_group" "resource_group2" {
  name     = "VB_RG2"
      
    }

data "azurerm_virtual_network" "vnet1" {
   name                = "vb_vnet1"
  resource_group_name = "${data.azurerm_resource_group.resource_group1.name}"
}

data "azurerm_virtual_network" "vnet2" {
  name                = "vb_vnet2"
  resource_group_name = "${data.azurerm_resource_group.resource_group2.name}"
}


resource "azurerm_virtual_network_peering" "vnet_peer_1" {
  name                         = "vnet1_to_vnet2"
  resource_group_name          = "${data.azurerm_resource_group.resource_group1.name}"
  virtual_network_name         = "${data.azurerm_virtual_network.vnet1.name}"
  remote_virtual_network_id    = "${data.azurerm_virtual_network.vnet2.id}"
  allow_virtual_network_access = "true"
  allow_forwarded_traffic      = "true"
  use_remote_gateways          = "false"
}

resource "azurerm_virtual_network_peering" "vnet_peer_2" {
  name                         = "vnet2_to_vnet1"
  resource_group_name          = "${data.azurerm_resource_group.resource_group2.name}"
  virtual_network_name         = "${data.azurerm_virtual_network.vnet2.name}"
  remote_virtual_network_id    = "${data.azurerm_virtual_network.vnet1.id}"
  allow_virtual_network_access = "true"
  allow_forwarded_traffic      = "true"
  use_remote_gateways          = "false"
}