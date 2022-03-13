targetScope = 'subscription'
@description('Resource group name')
param name string
@description('Resource group location / Azure Region')
param location string
var tags = {
  tag1: 'Tag 1'
  tag2: 'Tag 2'
}

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: name
  location: location
  tags: tags
}

output ResourceGroupName string = rg.name
