# Getting a list of unused Azure NICs not linked with VM nor PE
Get-AzNetworkInterface `
| Where-Object {($_.VirtualMachine -eq $null) -And (($_.PrivateEndpointText -eq $null) -Or ($_.PrivateEndpointText -eq 'null'))} `
| Format-Table Name,ResourceGroupName
