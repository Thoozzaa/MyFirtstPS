
$downloadPath = "C:\Downloads"

if (-Not (Test-Path -Path $downloadPath)) {
    New-Item -Path $downloadPath -ItemType Directory
}
function Install-Software {
    param (
        [string]$url,
        [string]$installerName,
        [string]$arguments
    )

    $installerPath = "$downloadPath\$installerName"

    Invoke-WebRequest -Uri $url -OutFile $installerPath

    Start-Process -FilePath $installerPath -ArgumentList $arguments -NoNewWindow -Wait
}

#Install van Chrome
Install-Software -url "https://dl.google.com/chrome/install/latest/chrome_installer.exe" `
                 -installerName "chrome_installer.exe" `
                 -arguments "/silent /install"
#Install van VLC
Install-Software -url "https://get.videolan.org/vlc/3.0.11.1/win64/vlc-3.0.11.1-win64.exe" `
                 -installerName "vlc_installer.exe" `
                 -arguments "/S"

#Install van 7-Zip
Install-Software -url "https://www.7-zip.org/a/7z1900-x64.exe" `
                 -installerName "7zip_installer.exe" `
                 -arguments "/S"

Write-Host "Alle software is geïnstalleerd."
