@echo off

%utf8%

::echo.
::set /p maven=请选择 maven 目录路径：
set maven=%~dp0data\wrapper\dists\apache-maven-3.6.3-bin\1iopthnavndlasol9gbrbg6bf2\apache-maven-3.6.3

set app=data\app

echo.
rd /s /q %app%
mklink /h /j %app% %maven%

set SETTING_NAME=settings-local.xml

call link-file %~dp0data\conf %~dp0data %SETTING_NAME% settings.xml
call link-file %~dp0data\conf %app%\conf %SETTING_NAME% settings.xml

call link-file %~dp0data\bin %app%\bin mvn8.bat

call link-dir %~dp0data %userprofile%\.m2

call link-dir F:\build\maven\repository %userprofile%\.m2\repository

pause >nul
