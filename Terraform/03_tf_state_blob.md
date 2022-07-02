# Create required Azure resources

```Bash
#!/bin/bash
RESOURCE_GROUP_NAME=tfstate
STORAGE_ACCOUNT_NAME=tfstate'devopslabs2022'
CONTAINER_NAME=tfstate'-devops-labs'

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location germanywestcentral

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

# Configure terraform backend state
# Get the storage access key and store it as an environment variable
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY
```

# Create a Terraform configuration with a backend configuration block

```T
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "<storage_account_name>"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}
```

# Initialize configuration

```Bash
terraform init
```