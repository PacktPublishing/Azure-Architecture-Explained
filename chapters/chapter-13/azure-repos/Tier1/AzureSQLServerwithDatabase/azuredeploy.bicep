@minLength(1)
param hackathonssAdminLogin string

@secure()
param hackathonssAdminLoginPassword string
param Location string

@minLength(1)
param partsunlimited_dbName string

@minLength(1)
param partsunlimited_dbCollation string = 'SQL_Latin1_General_CP1_CI_AS'

@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param partsunlimited_dbEdition string = 'Basic'

@description('Describes the performance level for Edition')
@allowed([
  'Basic'
  'S0'
  'S1'
  'S2'
  'P1'
  'P2'
  'P3'
])
param partsunlimited_dbRequestedServiceObjectiveName string = 'Basic'

var hackathonasdName = 'arghackas${uniqueString(resourceGroup().id)}'
var hackathonssName = 'arghackss${uniqueString(resourceGroup().id)}'

resource hackathonss 'Microsoft.Sql/servers@2014-04-01-preview' = {
  name: hackathonssName
  location: Location
  tags: {
    displayName: 'hackathonss'
  }
  properties: {
    administratorLogin: hackathonssAdminLogin
    administratorLoginPassword: hackathonssAdminLoginPassword
  }
  dependsOn: []
}

resource hackathonssName_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2022-05-01-preview' = {
  parent: hackathonss
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource hackathonssName_partsunlimited_db 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: hackathonss
  name: partsunlimited_dbName
  location: Location
  tags: {
    displayName: 'partsunlimited_db'
  }
  properties: {
    collation: partsunlimited_dbCollation
    edition: partsunlimited_dbEdition
    maxSizeBytes: '1073741824'
    requestedServiceObjectiveName: partsunlimited_dbRequestedServiceObjectiveName
  }
}
