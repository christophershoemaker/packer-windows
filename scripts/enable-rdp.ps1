# Allow RDP Connections
set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -name "fDenyTSConnections" -Value 0 -erroraction silentlycontinue
# Update firewall rules
# netsh advfirewall firewall set rule group=”remote desktop” new enable=yes
Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Set-NetFirewallRule -Enabled True