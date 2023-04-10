param appServicePrefix string = 'appService'
param location string = 'eastus'
param appServicePlanId string

resource appService 'Microsoft.Web/sites@2021-01-15' = {
  name: '${appServicePrefix}site'
  location: location
  properties:{
    siteConfig:{
      linuxFxVersion: 'DOTNETCORE|3.0'
    }
    serverFarmId: appServicePlanId
  }
}
// Set an output which can be accessed by the module consumer
output siteURL string = appService.properties.hostNames[0]
