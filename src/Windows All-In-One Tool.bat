@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
:start
cls
echo Hello there, %username%!
echo:
echo                          ^|               Windows All-In-One Tool v1.0.0-beta                     ^|
echo                          ^|                      Made by Minionguyjpro                            ^|
echo                          ^|                                                                       ^|
echo                          ^|[1] DISM and SFC Repair           [5] Check Windows Version            ^|
echo                          ^|[2] Create Restore Point          [6] Ping Tool                        ^|
echo                          ^|[3] Windows IP Configuration      [7]                                  ^|
echo                          ^|[4] User List                     [8] Open Terminal                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|[ ]                                                                    ^|
echo                          ^|     [9] Credits          [10] Tool Information          [11] Exit     ^|
set /p task=Enter a number: 
if %task%==1 goto 1
if %task%==2 goto 2
if %task%==3 goto 3
if %task%==4 goto 4
if %task%==5 goto 5
if %task%==6 goto 6
if %task%==7 goto 7
if %task%==8 goto 8
if %task%==9 goto 9
if %task%==10 goto 10
if %task%==11 goto 11
:invalid_task
cls
color 47
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo                               ===                      ERROR!                      ===
echo                               ===  You have entered an invalid number for a task!  ===
echo                               ===                                                  ===
timeout /t 3 > nul
color 7
if %back_to_terminal%==0 goto 8
goto start
:1
cls
DISM.exe /Online /Cleanup-image /Restorehealth
SFC.exe /scannow
<nul set /p "=Done checking? Press a key to proceed..."
pause >nul
goto start
:2
cls
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Restore Point", 100, 7
echo Create restore point done!
goto start
:3
cls
IPCONFIG.exe
echo:
<nul set /p "=Done reading? Press a key to proceed..."
pause >nul
goto start
:4
cls
WMIC.exe userAccount get Name
<nul set /p "=Done reading/checking? Press a key to proceed..."
pause >nul
goto start
:5
cls
color 47
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo                               ===                       NOTE                       ===
echo                               === Please close the new window in order to go back. ===
echo                               ===                                                  ===
WINVER.exe
color 7
goto start
:6
cls
set /p ping_tool=Enter a website to ping or use arguments and subcommands for the 'ping' command "Do not include 'ping' in command": 
echo.%ping_tool%|findstr /C:"ping" >nul 2>&1
if not errorlevel 1 goto error_ping_detected
if %ping_tool%==exit goto start
ping %ping_tool%
set /p another_ping=Do you want to use the ping tool again? [Y/N] 
if %another_ping%==y goto 6
if %another_ping%==Y goto 6
if %another_ping%==n goto start
if %another_ping%==N goto start
<nul set /p "=Done reading? Press a key to proceed..."
pause >nul
:8
cls
echo:
echo:
echo                          ^|                               Terminals                               ^|
echo                          ^|                     Choose a terminal from below:                     ^|
echo                          ^|                                                                       ^|
echo                          ^|[1] Command Prompt               [2] Check Windows Version             ^|
echo                          ^|                              [3] Go back                              ^|
set /p terminal_task=Enter a number: 
if %terminal_task%==1 goto terminal_1
if %terminal_task%==2 goto terminal_2
if %terminal_task%==3 goto start
set back_to_terminal=0
goto invalid_task
:9
cls
echo:
echo:
echo                          ^|                                 Credits                               ^|
echo                          ^|                         All the credits go to:                        ^|
echo                          ^|                                                                       ^|
echo                          ^|                  1. Minionguyjpro - Developer and owner               ^|
echo                          ^| 2. Microsoft - Developer and maker of Windows systems (including CMD) ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo:
<nul set /p "=Done reading? Press a key to proceed..."
pause >nul
goto start
:10
cls
echo:
echo:
echo                          ^|                         Tool Information/Info                         ^|
echo                          ^|                                                                       ^|
echo                          ^|                         Author: Minionguyjpro                         ^|
echo                          ^|                            Version: v1.0.0                            ^|
echo:
<nul set /p "=Done reading? Press a key to proceed..."
pause >nul
goto start
:11
set /p exit_confirm= Are you sure you want to exit? [Y/N] 
if %exit_confirm%==y goto 11_exit
if %exit_confirm%==Y goto 11_exit
if %exit_confirm%==n goto 11_return
if %exit_confirm%==N goto 11_return
:invalid_exit_confirmation
goto 11
:11_exit
cls
echo See you soon!
timeout /t 3 > nul
exit
:11_return
cls
goto start
:terminal_1
cmd.exe
:terminal_2
:terminal_3
:error
pause
goto %task%
:error_ping_detected
cls
color 47
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo                               ===                      ERROR!                      ===
echo                               ===      Do not add 'ping' to the command. So,       ===
echo                               === 'ping -t google.com' would become the following: ===
echo                               === '-t google.com', but that is ONLY for this tool! ===
timeout /t 8 > nul
color 7
goto 6