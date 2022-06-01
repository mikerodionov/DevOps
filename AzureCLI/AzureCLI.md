# Azure CLI Tips & Tricks

## Get tenant ID for subscription

```Bash
# If necessary install jq with sudo apt install jq
az account show --subscription SubscriptionName | jq -r '.tenantId'
```
