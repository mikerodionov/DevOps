# Azure CLI Tips & Tricks

## Get tenant ID for subscription

```Bash
# If necessary install jq with sudo apt install jq
az account show --subscription SubscriptionName | jq -r '.tenantId'
```

## Get AKS versions

```Bash
az aks get-versions --location westeurope --output table
```
## Get available Azure VM sizes

```Bash
az vm list-sizes --location germanywestcentral --output table | grep Standard_F
```
