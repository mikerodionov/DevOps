# Azure CLI Tips & Tricks

## List Azure Subscriptions & shange active subscription

```Bash
az account list --output table
az account set --subscription subscription-name
```

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
az vm list-skus --location germanywestcentral --output table | grep Standard_F
```
## Get VNET info

```Bash
az network vnet show --resource-group vnet-rg-name --name vnet-name
```
