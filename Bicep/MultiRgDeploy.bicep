// Deploy multiple RGs
targetScope = 'subscription'
param azureRegion string = 'eastus'

resource appGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-applications-rg'
  location: azureRegion
  tags: {
    'Project': 'Bicep Demo'
  }
}

module appService 'MultiRgDeployWebAppSampleModule.bicep' = {
  scope: resourceGroup(appGroup.name)
  name: 'webAppDeployment-${uniqueString(appGroup.id)}'
}

resource containerGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-containers-rg'
  location: azureRegion
  tags: {
    'Project': 'Bicep Demo'
  }
}

module containerRegistry 'MultiRgDeployContainerRegistry.bicep' = {
  scope: resourceGroup(containerGroup.name)
  name: 'acrDeployment-${uniqueString(containerGroup.id)}'
}

resource storageGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-storages-rg'
  location: azureRegion
  tags: {
    'Project': 'Bicep Demo'
  }
}

module bicepStorage 'MultiRgDeploySimpleStorageParametrizedExtExpressionsVariablesOutput.bicep' = {
  scope: resourceGroup(storageGroup.name)
  name: 'storageDeployment-${uniqueString(storageGroup.id)}'
  params: {
    azureRegion: azureRegion
    storageName: 'bicepstorage20032022'
  }
}
