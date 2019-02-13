Clear-Host
$Host
Import-Module AzureRM.NetCore.Preview 
Import-Module AzureRM.Profile.NetCore.Preview
Import-Module AzureRM.Resources.NetCore.Preview
Install-Module AzureRM.Profile.Netcore

                       


Clear-Host
#Install-Module -Name AzureRM -RequiredVersion 2.4.0 -Repository PSGallery -Force
#Invoke-AzureRmResourceAction  -ResourceGroupName $resourceGroupName -ResourceType 'Microsoft.ApiManagement/service/users' -Action 'token' -ResourceName "$serviceName/$userId" -ApiVersion "2016-10-10" -Parameters $parameters

     #Import-Module AzureRM.NetCore.Preview 
     #Add-AzureRmAccount -ClientId <appId> -Secret <secretKey> -TenantId <tenantId>
     
     
get-content -Path "/root/project/tools/profile.json"
  Select-AzureRmProfile -Path "/root/project/tools/profile.json"
  
  Get-Azurermtenant

  $azureAccountName ="sdey@tollplus.com"
$azurePassword = ConvertTo-SecureString "satyam1$2$3" -AsPlainText -Force

$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)

#Login-AzureRmAccount -Credential $psCred
   
 # Login-AzureRMAccount 
#$pwUrlencodedLowerCase = [System.Web.HttpUtility]::UrlEncode($pw.value)

# Seems like password has to be URL-encoded with UPPERCASE heximal digits (e.g. %3D instead of %3d) for Git to authenticate properly:
#[regex]$regex='(%[0-9a-f][0-9a-f])'
#$pwUrlencoded = $regex.Replace($pwUrlencodedLowerCase, {$args[0].Value.ToUpper()})
