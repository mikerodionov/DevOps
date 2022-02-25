targetScope = 'subscription'

param rgName string = 'Resource Group Name'
@description = "Azure Region"
param rgLocation  string = 'Nort'
@allowed([

])

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: rgLocation
  tags: tags
}

output ResourceGroupName string = rg.name
