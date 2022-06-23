# Create Resource Group
resource "azurerm_resource_group" "vm" {
  name     = "rg-${var.environment}-${var.location}-${var.workloadname}"
  location = var.location
  tags     = var.required_tags
}

# Create VNIC
resource "azurerm_network_interface" "vnic0" {
  name                = "nic-vm-${var.workloadname}-vnic0"
  location            = var.location
  resource_group_name = azurerm_resource_group.vm.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

# Create VMs
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-${var.workloadname}"
  location            = var.location
  resource_group_name = azurerm_resource_group.vm.name
  size                = var.size
  admin_username      = var.vmuser
  admin_password      = var.vmpass

  boot_diagnostics {
    storage_account_uri = var.bootdiagsep
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.sku
    version   = "latest"
  }

  os_disk {
    name                 = "disk-vm-${var.workloadname}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  network_interface_ids = [azurerm_network_interface.vnic0.id]

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
