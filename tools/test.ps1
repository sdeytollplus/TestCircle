Clear-Host
$Host

Install-Module -Name Az -AllowClobber -force


Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Install-Module AzureRM
Install-Module Azure

Get-AzureRmSubscription