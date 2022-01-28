# Make sure to connect with Connect-AzAccount
# Make sure to switch to the right subscription with Set-AzContext
# Script below checks whether privateLinkServiceNetworkPolicies enabled for subnet, when enabled it prevents you from creating PEs within the subnet
# MSFT docs: https://docs.microsoft.com/en-us/azure/private-link/disable-private-endpoint-network-policy
$virtualSubnetName = "default"
$virtualNetwork= Get-AzVirtualNetwork `
  -Name "myVirtualNetwork" ` 
  -ResourceGroupName "myResourceGroup"
($virtualNetwork | Select -ExpandProperty subnets | Where-Object  {$_.Name -eq $virtualSubnetName}).privateLinkServiceNetworkPolicies

# Disable PrivateEndpointNetworkPolicies
# Make sure to connect with Connect-AzAccount
# Make sure to switch to the right subscription with Set-AzContext
$net =@{
    Name = 'myVNet'
    ResourceGroupName = 'myResourceGroup'
}
$vnet = Get-AzVirtualNetwork @net
($vnet | Select -ExpandProperty subnets | Where-Object {$_.Name -eq 'default'}).PrivateEndpointNetworkPolicies = "Disabled"
$vnet | Set-AzVirtualNetwork
