param VnetName string
param SubnetName string

var HackNetPrefix = '10.0.0.0/16'
var HackNetSubnet1Name = SubnetName
var HackNetSubnet1Prefix = '10.0.1.0/24'

resource Vnet 'Microsoft.Network/virtualNetworks@2016-03-30' = {
  name: VnetName
  location: resourceGroup().location
  tags: {
    displayName: 'HackNet'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        HackNetPrefix
      ]
    }
    subnets: [
      {
        name: HackNetSubnet1Name
        properties: {
          addressPrefix: HackNetSubnet1Prefix
        }
      }
    ]
  }
  dependsOn: []
}