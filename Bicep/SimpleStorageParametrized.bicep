// Remove default value to get prompt on deploy
param storageName string
param azureRegion string = 'eastus'
param storageSku string = 'Standard_LRS'

// Use Bicep extension of VS Code & then res + required-properties to build minimum required definition
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageName
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
