Clear-Host
$Host

Install-Module -Name AzureRM.Profile.Netcore -RequiredVersion 0.9.1 -force
Import-Module AzureRM.NetCore.Preview 
Import-Module AzureRM.Profile.NetCore
Import-Module AzureRM.Resources.NetCore.Preview
#Install-Module AzureRM.Profile.Netcore

                       


Clear-Host
#Install-Module -Name AzureRM -RequiredVersion 2.4.0 -Repository PSGallery -Force
#Invoke-AzureRmResourceAction  -ResourceGroupName $resourceGroupName -ResourceType 'Microsoft.ApiManagement/service/users' -Action 'token' -ResourceName "$serviceName/$userId" -ApiVersion "2016-10-10" -Parameters $parameters

     #Import-Module AzureRM.NetCore.Preview 
     #Add-AzureRmAccount -ClientId <appId> -Secret <secretKey> -TenantId <tenantId>
     
     
#get-content -Path "/root/project/tools/profile.json"
 # Select-AzureRmProfile -Path "/root/project/tools/profile.json"
  
  #Get-Azurermtenant

  $azureAccountName ="sdey@tollplus.com"
$azurePassword = ConvertTo-SecureString "satyam1$2$3" -AsPlainText -Force

$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
#$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)

Login-AzureRmAccount -Credential $psCred
   
 # Login-AzureRMAccount 
$resourceGroupName = '1723b1e9-520b-44b2-999e-d36c9da236f5'
$serviceName = '1723b1e9-520b-44b2-999e-d36c9da236f5'
$gitUser = 'apim'



$apimContext = New-AzureRmApiManagementContext -ResourceGroupName $resourceGroupName -ServiceName $serviceName

$gitAccess = Get-AzureRmApiManagementTenantGitAccess -Context $apimContext
$userId = $gitAccess.Id

$expiry = Get-Date ((Get-Date).AddDays(29)) -Format "yyyy-MM-ddTHH:mm:ss.000Z"
$parameters = @{ "keyType"= "primary"; "expiry"= "$expiry"; }

$pw = Invoke-AzureRmResourceAction  -ResourceGroupName $resourceGroupName -ResourceType 'Microsoft.ApiManagement/service/users' -Action 'token' -ResourceName "$serviceName/$userId" -ApiVersion "2016-10-10" -Parameters $parameters

# URL-encode password:
$pwUrlencodedLowerCase = [System.Web.HttpUtility]::UrlEncode($pw.value)

# Seems like password has to be URL-encoded with UPPERCASE heximal digits (e.g. %3D instead of %3d) for Git to authenticate properly:
[regex]$regex='(%[0-9a-f][0-9a-f])'
$pwUrlencoded = $regex.Replace($pwUrlencodedLowerCase, {$args[0].Value.ToUpper()})

$gitUrl = "https://${gitUser}:$pwUrlencoded@$serviceName.scm.azure-api.net/"

