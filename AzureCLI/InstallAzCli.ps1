# Windows
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
# Linux
# Download script for inspection & review
curl -sL https://aka.ms/InstallAzureCLIDeb
# Download and run script
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash