# Download Winget
$URL = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
$URL = (Invoke-WebRequest -Uri $URL).Content | ConvertFrom-Json |
        Select-Object -ExpandProperty "assets" |
        Where-Object "browser_download_url" -Match '.msixbundle' |
        Select-Object -ExpandProperty "browser_download_url"

# download
Invoke-WebRequest -Uri $URL -OutFile "Setup.msix" -UseBasicParsing

# install
Add-AppxPackage -Path "Setup.msix"

# delete file
Remove-Item "Setup.msix"

#Windows Update Installer
Install-Module PSWindowsUpdate --accept-source-agreements --accept-package-agreements
Add-WUServiceManager -MicrosoftUpdate --accept-source-agreements --accept-package-agreements

#Start Windows updates
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force --accept-source-agreements --accept-package-agreements

# Install "Lenovo Vantage" using winget
winget install "Lenovo Vantage" --source msstore --accept-source-agreements --accept-package-agreements

# Install Microsoft Store updates
winget upgrade -h --all

# Set time zone
Set-TimeZone -Id "Newfoundland Standard Time" -PassThru

# Sync time zone
Start-Process -FilePath "cmd.exe" -ArgumentList "/c w32tm /resync" -Verb RunAs

# Debloat Windows
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))

# Install Chocolatey (if not already installed)
$chocoInstalled = Get-Command -Name "choco" -ErrorAction SilentlyContinue
if (-not $chocoInstalled) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Define the packages to install
$packages = @(
    "googlechrome",
    "brave",
    "firefox",
    "vlc",
    "libreoffice-fresh",
    "7zip"
)

# Install each package
foreach ($package in $packages) {
    choco install $package -y
}