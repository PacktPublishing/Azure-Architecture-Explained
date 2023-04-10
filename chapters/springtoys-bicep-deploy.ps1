$date = Get-Date -Format "MM-dd-yyyy"
$rand = Get-Random -Maximum 1000
$deploymentName = "AzureExplained-Deployment-"+"$date"+"-"+"$rand"
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName springtoys-RG -TemplateFile .\main.bicep -TemplateParameterFile .\azuredeploy.parameters.json -c
