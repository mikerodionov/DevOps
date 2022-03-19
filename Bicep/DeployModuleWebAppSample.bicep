// Module to be referred to/called by main Bicep file
param azureRegion string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'MikhailAppServicePlan'
  location: azureRegion
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-03-01' = {
  name: 'app-name-917'
  location: azureRegion
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webApplicationHostName string = webApplication.properties.defaultHostName
