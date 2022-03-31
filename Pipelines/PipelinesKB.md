# Azure DevOps pipelines KB

## Passing in variables as a values to job parameter

In a pipeline you cad define pipeline level variables and then pass them in as a value for job parameters
```
name: Deploy_Resource_Group
trigger: none # will disable CI builds (but not PR builds)
variables:
  myvariable: some value

jobs:
  - template: /Templates/template.yaml
    parameters:
      myparameter: $(myvariable)
```
You can reference variable in a lazy or explicit way:
```
myparameter: $(myvariable) # This can be resolved only on run stage
myparameter: ${{ variables.myvariable }} # This can be resolved both on run and build stage
```
As a best practice, always use explicit variable reference for all parameter values to ensure they are resolvable/available on all stages of pipeline.

## To pull resources from specific branch

