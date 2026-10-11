@echo off
:: Gradle wrapper script for Windows
:: This is a minimal version; for production use the official wrapper

set GRADLE_VERSION=8.5
set GRADLE_DIST_URL=https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip
set GRADLE_HOME=%USERPROFILE%\.gradle\wrapper\dists\gradle-%GRADLE_VERSION%-bin

if not exist "%GRADLE_HOME%" (
    echo Downloading Gradle %GRADLE_VERSION%...
    mkdir "%GRADLE_HOME%" 2>nul
    cd /d "%GRADLE_HOME%"
    curl -L -o gradle.zip "%GRADLE_DIST_URL%"
    tar -xf gradle.zip
    del gradle.zip
    for /d %%i in (gradle-%GRADLE_VERSION%) do (
        move /y "%%i\*" .
        rmdir "%%i"
    )
)

for /r "%GRADLE_HOME%" %%i in (gradle.bat) do set GRADLE_EXEC=%%i

if not defined GRADLE_EXEC (
    echo Error: Could not find gradle.bat
    exit /b 1
)

call "%GRADLE_EXEC%" %*