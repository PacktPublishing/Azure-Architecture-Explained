@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Premium_LRS'
])
param HackathonSAType string = 'Standard_LRS'
param HackathonName string = 'hacktahon2019arg'
param ConteinerName string = 'aplicacion'

resource Hackathon 'Microsoft.Storage/storageAccounts@2016-01-01' = {
  name: HackathonName
  location: resourceGroup().location
  sku: {
    name: HackathonSAType
  }
  tags: {
    displayName: 'HackathonSA'
  }
  kind: 'Storage'
  dependsOn: []
}

resource HackathonName_default_Conteiner 'Microsoft.Storage/storageAccounts/blobServices/containers@2018-07-01' = {
  name: '${HackathonName}/default/${ConteinerName}'
  dependsOn: [
    Hackathon
  ]
}