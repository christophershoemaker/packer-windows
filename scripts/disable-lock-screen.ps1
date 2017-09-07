$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows"
$key = "Personalization"
$Name = "NoLockScreen"
$value = "1"

New-Item -Path $registryPath -Name Personalization
New-ItemProperty -Path $registryPath\$key -Name $name -Value $value -PropertyType DWORD -Force | Out-Null