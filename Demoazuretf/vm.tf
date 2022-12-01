variable "vmname1" {
  default = ""
}

resource "azurerm_virtual_network" "vnet1" {
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg1.location
  name                = "demovnet"
  resource_group_name = azurerm_resource_group.rg1.name
}

/*resource "azurerm_virtual_network" "vnet2" {
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg1.location
  name                = "demovnet2"
  resource_group_name = azurerm_resource_group.rg1.name
}*/


resource "azurerm_network_interface" "nic1" {
  location            = azurerm_resource_group.rg1.location
  name                = "demonic1"
  resource_group_name = azurerm_resource_group.rg1.name
  ip_configuration {
    name                          = "nicIp1"
    subnet_id = azurerm_subnet.snet1.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_subnet" "snet1" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  /*virtual_network_name = "demovnet"*/
}

/*resource "azurerm_subnet" "snet2" {
  address_prefixes     = ["10.1.0.0/24"]
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  *//*virtual_network_name = "demovnet"*//*
}*/




resource "azurerm_linux_virtual_machine" "vm1" {
  location              = azurerm_resource_group.rg1.location
  name                  = var.vmname1
  admin_username        = "demo1"
  admin_password        = "demodemodemo@123"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic1.id]
  resource_group_name   = azurerm_resource_group.rg1.name
  size                  = "Standard_D2s_v3"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    offer     = "UbuntuServer"
    publisher = "Canonical"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}


