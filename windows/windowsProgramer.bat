@echo off
SETLOCAL
if(Test-Path -Path "$env:ProgramData\Chocolatey"){
    call :installPackages
}

else{
    Set-ExecutionPolicy AllSigned

    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    call :installPackages
}

:installPackages

$packages = 'python3' , 'firefox' , 'spotify', 'nodejs' , 'git' , 'googlechrome' , 'vlc' , 'jre8', 'adobereader' , 'winrar' , 'putty.install' , 'visualstudio-installer' , 'steam' , 'virtualbox' , 'discord' , 'postman'

ForEach($package in $packages)
{
    choco install $package -y
}

EXIT /B 0