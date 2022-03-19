// Bicep has 4 target scopes defining scope of deployment - managementGroup, resourceGroup, subscription, tenant
targetScope = 'subscription'
// If default target scope is not specified in bicep file we deploy into RG defined during deployment which is not recommended
