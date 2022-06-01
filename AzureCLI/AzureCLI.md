# Azure CLI Tips & Tricks

## Get tenant ID for subscription

```Bash
az account show --subscription SubscriptionName | jq -r '.tenantId'
```
