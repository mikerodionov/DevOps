// This file adds use of variables
// StorageSKU change based on environment
// Remove default value to get prompt on deploy or use parameters file
param storageName string
param azureRegion string
param environment string = 'dev'
var accountName = '${storageName}${environment}'
// Use of ternary/inline if to set Standard_GRS for prod environment, otherwise use Standard_LRS
var storageAccountSkuName = (environment == 'prod') ? 'Standard_GRS': 'Standard_LRS'

// Use Bicep extension of VS Code & then res + required-properties to build minimum required definition
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
// We could have hyphen in between parameters yet storage account names do not allow for that
  name: accountName
  location: azureRegion
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
}
