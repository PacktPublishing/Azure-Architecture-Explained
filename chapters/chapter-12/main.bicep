//Parameters
param location string = 'eastus'
param storageAccountName string = 'springtoysstg'

//Variables
var storageSku = 'Premium_LRS'
var storageKind = 'StorageV2'

//Resources
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  kind: storageKind
  sku: {
    name: storageSku
  }
}

//Outputs
output stringOutput string = deployment().name
output endpoint string = storageAccount.properties.primaryEndpoints.blob
