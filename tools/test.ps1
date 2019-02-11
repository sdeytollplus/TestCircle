Clear-Host
$Host

Install-Module -Name Az -AllowClobber -force


Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Install-Module AzureRM -force
Install-Module Azure  -force

Get-AzureRmSubscription