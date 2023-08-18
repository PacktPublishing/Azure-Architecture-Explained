//parameters
param location string = 'eastus'
param springToysPrefix string = 'springtoys'

//define target 
targetScope = 'subscription'

//define new resoruce group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${springToysPrefix}Rg'
  location: location
}

//consume appServicePlan as module
module appServicePlan 'appServicePlan.bicep' = {
  name:'appServicePlan'
  scope: resourceGroup
  params: {
    location: location
    appPlanPrefix: springToysPrefix
  }
}

//consume appService as module
module appService 'appService.bicep' = {
  name: 'appService'
  scope: resourceGroup
  params: {
    location: location
    appServicePlanId: appServicePlan.outputs.appServicePlanId
    appServicePrefix: springToysPrefix
  }
}
