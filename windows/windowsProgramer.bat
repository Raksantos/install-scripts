@echo off
cls

set currentpath=%cd%

echo "Instalando Apps com Chocolatey"
echo "Scripts precisam ser rodados no modo admin do cmd"
ECHO.

:MENU
ECHO .................................................................................
ECHO PRESSIONE 1, 2 OU 3 PARA SELECIONAR SUA OPCAO OU 4 PARA SAIR.
ECHO SE FOR A PRIMEIRA VEZ UTILIZANDO O SCRIPT, APERTE 3 PARA OBTER O CHOCOLATEY
ECHO .................................................................................
ECHO 1 - Apps para usuarios padrao
ECHO 2 - Apps para devs
ECHO 3 - Chocolatey
ECHO 4 - Update de apps
ECHO 5 - Sair
ECHO.

SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO GEN
IF %M%==2 GOTO GEN
IF %M%==3 GOTO FIR
IF %M%==4 GOTO UPG
IF %M%==5 GOTO EOF

REM developer tools
:FIR
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco upgrade chocolatey
ECHO ...............................................
ECHO A RESTART OF THE BATCH FILE IS MAYBE NECESSARY!!
ECHO ...............................................
ECHO ...............................................
GOTO MENU

:UPG
choco upgrade all
GOTO MENU

:GEN
REM basic apps
choco install %currentpath%\defaultapps.config   
IF %M%==2 GOTO DEV
GOTO MENU

:DEV
REM developer tools
choco install %currentpath%\devapps.config   
GOTO MENU

:EOF
