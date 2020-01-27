Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install nodejs-lts -y --force
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
npm i -g azure-functions-core-tools@3 --unsafe-perm true >> afctlog.txt
#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -force
#Install-Module -Name Az -AllowClobber -Scope AllUsers -force
code --install-extension ms-vscode.csharp >> vscodelog.txt
code --install-extension ms-vscode.azurecli >> vscodelog.txt
code --install-extension ms-azuretools.vscode-azurefunctions >> vscodelog.txt
code --install-extension ms-vscode.azure-account >> vscodelog.txt
code --install-extension ms-azuretools.vscode-azurestorage >> vscodelog.txt
code --install-extension ms-vscode.powershell >> vscodelog.txt
