param appPlanPrefix string
param sku string = 'F1'
param location string = 'eastus'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  //interpolate param
  name: '${appPlanPrefix}AppPlan'
  //pass on location param
  location: location
  kind: 'linux'
  sku: {
    //pass on sku param
    name: sku
  }
  properties:{
    reserved: true
  }
  
}
// Set an output which can be accessed by the module consumer
output appServicePlanId string = appServicePlan.id
