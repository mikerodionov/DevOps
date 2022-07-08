resource "azurerm_virtual_machine_extension" "ad_login_extension" {
  name                 = "AADLoginForLinux"
  virtual_machine_id   = azurerm_virtual_machine.your-vm-name.id
  publisher            = "Microsoft.Azure.ActiveDirectory.LinuxSSH"
  type                 = "AADLoginForLinux"
  type_handler_version = "1.0"
  auto_upgrade_minor_version = true
}
