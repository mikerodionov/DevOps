# Azure Bicep Useful Information & Tips

## Deployment scopes

* Default = Resource Group
* Defined (explicit) scopes:
    * Management group
    * Tenant
    * Subscription

![image](/Bicep/Images/BicepDeploymentTargetScopes.png)

## Module Design Patterns

* Clear purpose, e.g. create modules which group resources by intended use
* Clear parameters and outputs
* Self-containeed design
* No secrets as an output


## Module Design Anit-Patterns

* Creating separate module for every resource

## Pre-flight validation options

There are 2 options to run pre-flight validation
* what-if - pre-flight checks before deployment into SUBSCRIPTION
```
az deployment sub what-if --location eastus --template-file .\yourtemplate.bicep
```
* -c - pre-flight checks before creation/deployment, you will get a prompt to confirm deployment
```
az deployment sub create --location eastus --template-file .\yourtemplate.bicep -c
```

## When you still need to look at ARM templates?

* Brownfield project - we can use ARM templates and Resource visualizer to explore existing resources and dependencies
* Discovery of Azure environment resources - we can use ARM templates and Resource visualizer to explore existing resources and dependencies
* Identifying configuration and current state of Azure resources - we can read through ARM template to see resources configuration

### Azure Resources Visualizer

Azure Portal > Resource Group > Automation > Export Template > Visualize Template

![image](/Bicep/Images/AzurePortalResourceVisualizer.png)

It is normally possibly to download and deploy ARM template as is:
```
az deployment group what-if -g 'bicep-test' -f .\DownloadedArmTemplate.json
# When you get ARM as is from portal you can get OK from what-if pre-flight check, yet failure on deploy
# Usually you neec correct/edit resources - removing undefined properties and any red errors highlighted in VS Code
```

## Decompile Azure Bicep

```
# Convert ARM/JSON to Bicep
az bicep decompile -f .\BicepDemo.json
# Remove read-only properties from Bicep and deploy with pre-flight validation
az deployment group create -g 'rg-bicep-test' -f .\BicepDemo.bicep -c
```