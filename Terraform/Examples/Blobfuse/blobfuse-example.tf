resource "azurerm_resource_group" "blobfuse-example-rg" {
  name     = "blobfuse-example-rg"
  location = "germanywestcentral"
}

resource "azurerm_storage_account" "blobfusemount202207" {
  resource_group_name = azurerm_resource_group.blobfuse-example-rg.name
  location = azurerm_resource_group.blobfuse-example-rg.location
  account_replication_type = "LRS"
  account_tier = "Standard"
  name = "blobfusemount202207"
}

resource "azurerm_storage_container" "logs" {
  storage_account_name = azurerm_storage_account.blobfusemount202207.name
  name = "logs"
}

resource "azurerm_storage_blob" "sample_log_file" {
  name                   = "sample_log.txt"
  storage_account_name   = azurerm_storage_account.blobfusemount202207.name
  storage_container_name = azurerm_storage_container.logs.name
  type                   = "Block"
  source                 = "${path.root}/sample_log.txt"
}

resource "azurerm_virtual_network" "blobfuse-vnet" {
  name                = "blobfuse-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.blobfuse-example-rg.location
  resource_group_name = azurerm_resource_group.blobfuse-example-rg.name
}

resource "azurerm_subnet" "internal-snet" {
  name                 = "internal-snet"
  resource_group_name  = azurerm_resource_group.blobfuse-example-rg.name
  virtual_network_name = azurerm_virtual_network.blobfuse-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "blobfuse-vm-nic" {
  name                = "blobfuse-vm-nic"
  location            = azurerm_resource_group.blobfuse-example-rg.location
  resource_group_name = azurerm_resource_group.blobfuse-example-rg.name

  ip_configuration {
    name                          = "blobfuse-vm-ip-configuration"
    subnet_id                     = azurerm_subnet.internal-snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.blobfuse-vm-nic-public-ip.id
  }
}

resource "azurerm_public_ip" "blobfuse-vm-nic-public-ip" {
  name                    = "blobfuse-vm-nic-public-ip"
  location                = azurerm_resource_group.blobfuse-example-rg.location
  resource_group_name     = azurerm_resource_group.blobfuse-example-rg.name
  allocation_method       = "Dynamic"
  tags = {
    environment = "blobfuse_demo"
  }
}

resource "azurerm_virtual_machine" "blobfuse-vm" {
  name                  = "blobfuse-vm"
  location              = azurerm_resource_group.blobfuse-example-rg.location
  resource_group_name   = azurerm_resource_group.blobfuse-example-rg.name
  network_interface_ids = [azurerm_network_interface.blobfuse-vm-nic.id]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  identity {
    type = "SystemAssigned"
  }

  # storage_image_reference {
  #   publisher = "OpenLogic"
  #   offer     = "CentOS-LVM"
  #   sku       = "7-LVM"
  #   version   = "latest"
  # }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "blobfuse-vm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "blobfuse_demo"
  }
}

resource "azurerm_role_assignment" "blobfuse-vm-storage-reader" {
  scope                = azurerm_storage_account.blobfusemount202207.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_virtual_machine.blobfuse-vm.identity[0].principal_id
}

resource "azurerm_network_security_group" "allow-ssh-nsg" {
  name                = "allow-ssh-nsg"
  location            = azurerm_resource_group.blobfuse-example-rg.location
  resource_group_name = azurerm_resource_group.blobfuse-example-rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${chomp(data.http.myip.body)}"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "blobfuse_demo"
  }
}

resource "azurerm_network_interface_security_group_association" "blobfuse-vm-nsg" {
  network_interface_id      = azurerm_network_interface.blobfuse-vm-nic.id
  network_security_group_id = azurerm_network_security_group.allow-ssh-nsg.id
}

resource "null_resource" "execute_mount_script" {

    connection {
        type = "ssh"
        user = var.admin_username
        password = var.admin_password
        host = azurerm_public_ip.blobfuse-vm-nic-public-ip.ip_address
        port = 22
    }


    provisioner "remote-exec" {
        inline = [
            "/bin/bash /tmp/script.sh"
        ]
    }
}