#3. Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = "myrg1"
  location = "West US 2"
}

# 4. Create a virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = ["10.0.0.0/16"]
}
