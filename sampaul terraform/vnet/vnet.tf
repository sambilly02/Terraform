resource "azurerm_resource_group" "rg"{
  name = var.rg_name
  location = var.rg_location
  
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = resource.azurerm_resource_group.rg.name
  location            = resource.azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}   

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name


ip_configuration {
    name                          = "internal-privateip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "port80_and_22"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["80", "22"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "ass1" {
    network_interface_id      = azurerm_network_interface.nic.id
    network_security_group_id = azurerm_network_security_group.nsg.id
    depends_on = [
      azurerm_network_interface.nic,
      azurerm_network_security_group.nsg
    ]
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}