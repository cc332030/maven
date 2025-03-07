@echo off

set maven=%~dp0data\wrapper\dists\apache-maven-3.6.3-bin\1iopthnavndlasol9gbrbg6bf2\apache-maven-3.6.3

setx /M M2_HOME "%userprofile%\.m2\app"

set app=%~dp0data\app

call link-dir "%maven%" "%app%"

set SETTING_NAME=settings-local.xml

call link-file %~dp0data\conf %~dp0data %SETTING_NAME% settings.xml
call link-file %~dp0data\conf %app%\conf %SETTING_NAME% settings.xml

call link-file %~dp0data\bin %app%\bin mvn8.bat
call link-file %~dp0data\bin %app%\bin mvntree.bat
call link-file %~dp0data\bin %app%\bin mvntreetxt.bat

call link-dir %~dp0data %userprofile%\.m2

call link-dir F:\data\maven\repository %userprofile%\.m2\repository

pause >nul
