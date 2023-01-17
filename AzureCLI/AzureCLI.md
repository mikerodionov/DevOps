# Azure CLI Tips & Tricks

## List Azure Subscriptions & shange active subscription

```Bash
az account list --output table
az account set --subscription subscription-name
```

## Get tenant ID for subscription

```Bash
# If necessary install jq with sudo apt install jq
# For current subscription
az account show | jq -r '.tenantId'
# Explicitly specifying subscription
az account show --subscription SubscriptionName | jq -r '.tenantId'
```

## Get AKS versions

```Bash
az aks get-versions --location westeurope --output table
```
## Sign-in to AKS cluster

```Bash
az aks get-credentials --resource-group rg-name --name aks-name
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

## Ger region Display Names and Names

```Bash
az account list-locations --query "[].{DisplayName:displayName, Name:name}" -o table
```

## Azure VMs

```Bash
# Update VM user password
az vm user update \
  --resource-group myResourceGroup \
  --name myVM \
  --username azureuser \
  --password myNewPassword

# Get VM sizes per location
az vm list-sizes --location "westeurope"
```
