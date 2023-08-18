param AAName string = 'Automation01'

resource AA 'Microsoft.Automation/automationAccounts@2015-10-31' = {
  name: AAName
  location: resourceGroup().location
  properties: {
    sku: {
      name: 'Basic'
    }
  }
  tags: {
  }
}