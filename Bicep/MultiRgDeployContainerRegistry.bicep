// ContainerRegistryScopes.bicep

targetScope = 'resourceGroup'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: 'demoacr032022mikhail'
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

output containerRegistryLoginServer string = containerRegistry.properties.loginServer
