// Module to be referred to/called by main Bicep file


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'MikhailAppServicePlan'
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-03-01' = {
  name: 'app-name-917'
  location: resourceGroup().location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webApplicationHostName string = webApplication.properties.defaultHostName
