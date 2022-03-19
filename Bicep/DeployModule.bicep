// DeployModule.bicep - main file which refers module (another Bicep file)
module appService 'DeployModuleWebAppSample.bicep' = {
  name: 'MyNewBicepappDeployment'
  params: {
    azureRegion: resourceGroup().location
  }
}

output appServicesHostName string = appService.outputs.webApplicationHostName
