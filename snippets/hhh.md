@echo off
setlocal EnableDelayedExpansion

REM ===== SPRING PROFILE =====
set PROFILE=sit
REM ==========================

set BASE_DIR=%cd%

REM Read services to array
set i=0
for /f "usebackq tokens=* delims=" %%s in ("services.txt") do (
    set SERVICE=%%s

    REM Skip empty and commented lines
    if NOT "!SERVICE!"=="" (
        echo !SERVICE! | findstr /b "#" >nul
        if errorlevel 1 (
            set SERVICES[!i!]=!SERVICE!
            set /a i+=1
        )
    )
)

if %i%==0 (
    echo No services to start (services.txt empty or all commented).
    pause
    exit /b
)

REM Start the first pane
wt -w 0 nt -d "%BASE_DIR%\!SERVICES[0]!" cmd /k ^
"mvn spring-boot:run -Dspring-boot.run.profiles=%PROFILE% -Dspring-boot.run.jvmArguments=\"-Xms256m -Xmx256m\""

REM Add split panes for the rest
for /l %%n in (1,1,%i%) do (
    split-pane -w 0 -d "%BASE_DIR%\!SERVICES[%%n]!" cmd /k ^
    "mvn spring-boot:run -Dspring-boot.run.profiles=%PROFILE% -Dspring-boot.run.jvmArguments=\"-Xms256m -Xmx256m\""
)

REM Arrange 8 panes automatically in grid layout
wt -w 0 focus-tab -t 0; ^
move-pane -w 0 --direction down; ^
move-pane -w 0 --direction right; ^
move-pane -w 0 --direction right; ^
move-pane -w 0 --direction down; ^
move-pane -w 0 --direction left; ^
move-pane -w 0 --direction left;

echo.
echo ✅ All services started in one Windows Terminal with split panes (Profile: %PROFILE%).
echo Close this window but do not close the Terminal.
pause