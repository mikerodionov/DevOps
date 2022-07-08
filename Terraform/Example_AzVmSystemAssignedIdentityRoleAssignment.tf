data "azurerm_storage_account" "yourstorageaccount" {
  name                = "yourstorageaccount"
  resource_group_name = azurerm_resource_group.yourstorageaccount-rg.name
}

resource "azurerm_role_assignment" "your-vm-identity-blob-read-access" {
  scope                = data.azurerm_storage_account.yourstorageaccount.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_virtual_machine.your-vm.identity[0].principal_id
  skip_service_principal_aad_check = true
}
