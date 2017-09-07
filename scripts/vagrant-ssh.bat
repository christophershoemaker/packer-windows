:: vagrant public key
SET location="C:\Users\vagrant\.ssh"
if not exist "%location%" (
  mkdir %location%
)

if exist a:\vagrant.pub (
  copy a:\vagrant.pub %location%\authorized_keys
) else (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub', '%location%\authorized_keys')" <NUL
)
