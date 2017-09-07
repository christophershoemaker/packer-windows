rem echo "Disabling winrm"
rem call winrm set winrm/config/service/auth @{Basic="false"}
rem call winrm set winrm/config/service @{AllowUnencrypted="false"}
rem netsh advfirewall firewall set rule name="WinRM-HTTP" new action=block

echo "Running SYSPREP ..."
C:/windows/system32/sysprep/sysprep.exe /generalize /oobe /unattend:A:/Autounattend.xml /shutdown /quiet