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