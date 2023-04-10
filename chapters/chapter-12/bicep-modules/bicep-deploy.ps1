$date = Get-Date -Format "MM-dd-yyyy"
$rand = Get-Random -Maximum 1000
$deploymentName = "SpringToysDeployment-"+"$date"+"-"+"$rand"

New-AzDeployment -Name $deploymentName -TemplateFile .\main.bicep -Location eastus -c