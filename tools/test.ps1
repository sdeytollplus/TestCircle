Clear-Host
$Host
Import-Module AzureRM.NetCore.Preview 


#Install-Module -Name AzureRM -RequiredVersion 2.4.0 -Repository PSGallery -Force
Invoke-AzureRmResourceAction  -ResourceGroupName $resourceGroupName -ResourceType 'Microsoft.ApiManagement/service/users' -Action 'token' -ResourceName "$serviceName/$userId" -ApiVersion "2016-10-10" -Parameters $parameters

     Import-Module AzureRM.NetCore.Preview 
     
     
dir 
  Select-AzureRmProfile -Path './root/project/tools/profile.json'     
   
 # Login-AzureRMAccount 
#$pwUrlencodedLowerCase = [System.Web.HttpUtility]::UrlEncode($pw.value)

# Seems like password has to be URL-encoded with UPPERCASE heximal digits (e.g. %3D instead of %3d) for Git to authenticate properly:
#[regex]$regex='(%[0-9a-f][0-9a-f])'
#$pwUrlencoded = $regex.Replace($pwUrlencodedLowerCase, {$args[0].Value.ToUpper()})
