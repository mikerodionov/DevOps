// Remove default value to get prompt on deploy or if you will use parameters file
param storageName string
param azureRegion string
param storageSku string

// Use Bicep extension of VS Code & then res + required-properties to build minimum required definition
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageName
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
