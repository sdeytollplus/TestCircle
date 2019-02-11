Clear-Host
$Host

Install-Module -Name Az -AllowClobber -force



Install-Module AzureRM -force
Install-Module Azure  -force

Get-AzureRmSubscription