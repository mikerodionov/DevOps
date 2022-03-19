# Azure Bicep Useful Information & Tips

## Deployment scopes

* Default = Resource Group
* Defined scopes:
    * Management group
    * Tenant
    * Subscription

## Module Design Patterns

* Clear purpose, e.g. create modules which group resources by intended use
* Clear parameters and outputs
* Self-containeed design
* No secrets as an output


## Module Design Anit-Patterns

* Creating separate module for every resource