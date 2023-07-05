
This bicep template creates three VNets, and their associated subnets.

1. Create a resource group using Az PowerShell

```
new-azresourceGroup -Name "ContosoResourceGroup" -Location 'eastus'
```

2. Deploy the bicep template along with the parameters file using the command below: 

```
$date = Get-Date -Format "MM-dd-yyyy"
$rand = Get-Random -Maximum 1000
$deploymentName = "AzExplained-Deployment-"+"$date"+"-"+"$rand"
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName springtoys-RG -TemplateFile .\main.bicep -TemplateParameterFile .\azuredeploy.parameters.json -c

```
