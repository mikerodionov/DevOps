# Azure Bicep Useful Information & Tips

## Deployment scopes

* Default = Resource Group
* Defined scopes:
    * Management group
    * Tenant
    * Subscription

![image](https://user-images.githubusercontent.com/13007691/159129327-e4490493-7f37-403b-887b-95bfa7862aa5.png)

## Module Design Patterns

* Clear purpose, e.g. create modules which group resources by intended use
* Clear parameters and outputs
* Self-containeed design
* No secrets as an output


## Module Design Anit-Patterns

* Creating separate module for every resource
