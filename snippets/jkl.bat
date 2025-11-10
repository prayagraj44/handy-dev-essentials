@echo off
setlocal enabledelayedexpansion

REM ===== SPRING PROFILE =====
set PROFILE=sit
REM ==========================

set BASE_DIR=%cd%

REM Get first non-comment service to start the first pane
set FIRST_SERVICE=

for /f "usebackq tokens=* delims=" %%s in ("services.txt") do (
    set LINE=%%s
    if not "!LINE!"=="" (
        echo !LINE! | findstr /b "#" >nul
        if errorlevel 1 (
            if "!FIRST_SERVICE!"=="" set FIRST_SERVICE=!LINE!
        )
    )
)

if "!FIRST_SERVICE!"=="" (
    echo No services to start. Check services.txt
    pause
    exit /b
)

REM Start first pane
wt -d "%BASE_DIR%\!FIRST_SERVICE!" cmd /k ^
"mvn spring-boot:run -Dspring-boot.run.profiles=%PROFILE% -Dspring-boot.run.jvmArguments=\"-Xms256m -Xmx256m\""

REM Now open remaining services in split panes
for /f "skip=1 usebackq tokens=* delims=" %%s in ("services.txt") do (
    set LINE=%%s
    if not "!LINE!"=="" (
        echo !LINE! | findstr /b "#" >nul
        if errorlevel 1 (
            split-pane -d "%BASE_DIR%\!LINE!" cmd /k ^
            "mvn spring-boot:run -Dspring-boot.run.profiles=%PROFILE% -Dspring-boot.run.jvmArguments=\"-Xms256m -Xmx256m\""
            move-focus right
        )
    )
)

echo.
echo ✅ All services started in one Windows Terminal (Profile: %PROFILE%)
echo (Do NOT close the terminal tabs or panes.)
pause