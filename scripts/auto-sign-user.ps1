$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
$key = "Winlogon"
$DefaultPassword = "vagrant"
$AutoAdminLogon = "1"

New-ItemProperty -Path $registryPath\$key -Name "DefaultPassword" -Value $DefaultPassword -PropertyType String -Force | Out-Null
Set-ItemProperty -Path $registryPath\$key -Name "AutoAdminLogon" -Value $AutoAdminLogon | Out-Null