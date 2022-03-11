targetScope = 'subscription'

param name string = 'Resource Group Name'
@description = "Azure Region"
param location string
@description = "Tags"
var tags = {
  tag1 = 'Tag 1'
  tag2 = 'Tag 2'
}

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: Name
  location: Location
  tags: tags
}

output ResourceGroupName string = rg.name
