// Remove default value to get prompt on deploy
param storageName string
param azureRegion string
param storageSku string
param environment string = 'dev'

// Use Bicep extension of VS Code & then res + required-properties to build minimum required definition
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
// We could have hyphen in between parameters yet storage account names do not allow for that
  name: '${storageName}${environment}'
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
