@echo off
setlocal
set "VERSION=8.14.3"
set "BASE=%USERPROFILE%\.gradle\bootstrap"
set "GRADLE_HOME=%BASE%\gradle-%VERSION%"
if not exist "%GRADLE_HOME%\bin\gradle.bat" (
  if not exist "%BASE%" mkdir "%BASE%"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $zip='%BASE%\gradle-%VERSION%-bin.zip'; Invoke-WebRequest 'https://services.gradle.org/distributions/gradle-%VERSION%-bin.zip' -OutFile $zip; Expand-Archive -LiteralPath $zip -DestinationPath '%BASE%' -Force; Remove-Item $zip"
  if errorlevel 1 exit /b 1
)
call "%GRADLE_HOME%\bin\gradle.bat" -p "%~dp0" %*
exit /b %ERRORLEVEL%
