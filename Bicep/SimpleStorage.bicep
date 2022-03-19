// Use Bicep extension of VS Code & then res + required-properties to build minimum required definition
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'bicepstgdemomikhail'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
