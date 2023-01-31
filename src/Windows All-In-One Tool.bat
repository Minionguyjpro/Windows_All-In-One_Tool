@echo off
title Windows All-In-One Tool by Minionguyjpro

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
set back_to_terminal=0
set back_to_15=0
cls
echo Hello there, %username%!
echo:
echo                          ^|                 Windows All-In-One Tool v1.1.0-stable                 ^|
echo                          ^|                         Made by Minionguyjpro                         ^|
echo                          ^|                                                                       ^|
echo                          ^|[1] DISM and SFC Repair           [21] N/A                             ^|
echo                          ^|[2] Create Restore Point          [22] N/A                             ^|
echo                          ^|[3] Windows IP Configuration      [23] N/A                             ^|
echo                          ^|[4] User List                     [24] N/A                             ^|
echo                          ^|[5] Check Windows Version         [25] N/A                             ^|
echo                          ^|[6] Ping Tool                     [26] N/A                             ^|
echo                          ^|[7] Delete DNS cache              [27] N/A                             ^|
echo                          ^|[8] Open Terminal                 [28] N/A                             ^|
echo                          ^|[12] Boot into BIOS/UEFI (WinUEFI)[29] N/A                             ^|
echo                          ^|[13] Show System Information      [30] N/A                             ^|
echo                          ^|[14] Show Windows Directory       [31] N/A                             ^|
echo                          ^|[15] Empty temporary folder       [32] N/A                             ^|
echo                          ^|[16] N/A                          [33] N/A                             ^|
echo                          ^|[17] N/A                          [34] N/A                             ^|
echo                          ^|[18] N/A                          [35] N/A                             ^|
echo                          ^|[19] N/A                          [36] N/A                             ^|
echo                          ^|[20] N/A                          [37] N/A                             ^|
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
if %task%==12 goto 12
if %task%==13 goto 13
if %task%==14 goto 14
if %task%==15 goto 15
if %task%==16 goto 16
if %task%==17 goto 17
if %task%==18 goto 18
if %task%==19 goto 19
if %task%==20 goto 20
if %task%==21 goto 21
if %task%==22 goto 22
if %task%==23 goto 23
if %task%==24 goto 24
if %task%==25 goto 25
if %task%==26 goto 26
if %task%==27 goto 27
if %task%==28 goto 28
if %task%==29 goto 29
if %task%==30 goto 30
if %task%==31 goto 31
if %task%==32 goto 32
if %task%==33 goto 33
if %task%==34 goto 34
if %task%==35 goto 35
if %task%==36 goto 36
if %task%==37 goto 37
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
echo.%back_to_terminal%|findstr /C:"1" >nul 2>&1
if not errorlevel 1 goto 8
echo.%back_to_15%|findstr /C:"1" >nul 2>&1
if not errorlevel 1 goto 15
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
pause > nul
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
:7
cls
IPCONFIG.exe /flushdns
echo:
echo DNS cache has been deleted!
timeout /t 3 > nul
goto start
:8
cls
echo:
echo:
echo                          ^|                               Terminals                               ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^| Command Prompt: Command Prompt is included in all Windows systems and ^|
echo                          ^| is used widely to run many commands to perform certain actions.       ^|
echo                          ^|                                                                       ^|
echo                          ^| PowerShell: A console and scripting language which is widely used to  ^|
echo                          ^| perform many certain actions, on top of some Command Prompt features. ^|
echo                          ^| This are the default PowerShell version for each Windows OS:          ^|
echo                          ^|                                                                       ^|
echo                          ^| v1.0 - Windows XP SP2 and Windows Vista                               ^|
echo                          ^| v2.0 - Windows 7                                                      ^|
echo                          ^| v3.0 - Windows 7 SP1 and Windows 8                                    ^|
echo                          ^| v4.0 - Windows 8.1                                                    ^|
echo                          ^| v5.0 and v5.1 - Windows 10 / Windows 10 build 14393                   ^|
echo                          ^| v6.0 - Windows 7/8/10/11, Linux and MacOS                             ^|
echo                          ^| v7.X.X - Windows 7 (7.2 and lower)/8/10/11, Linux and MacOS           ^|
echo                          ^|                     Choose a terminal from below:                     ^|
echo                          ^|                                                                       ^|
echo                          ^|[1] Command Prompt               [2] Powershell                        ^|
echo                          ^|                              [3] Go back                              ^|
set /p terminal_task=Enter a number: 
if %terminal_task%==1 goto terminal_1
if %terminal_task%==2 goto terminal_2
if %terminal_task%==3 goto start
set back_to_terminal=1
goto invalid_task
:terminal_1
cls
cmd.exe
if errorlevel 0 goto 8
goto start
:terminal_2
cls
if exist "%ProgramFiles%\PowerShell\7\" (
  pwsh.exe 
) else (
  powershell.exe
)
if errorlevel 0 goto 8
if not errorlevel 0 echo PowerShell encountered an error or is not installed!
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
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
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
:12
cls
echo MAKE SURE TO SAVE ALL YOUR WORK FIRST!
pause
cls
echo Boot into BIOS/UEFI based on WinUEFI (https://github.com/FreakinSoftMania/WinUEFI/)
timeout /t 3 > nul
shutdown /fw /f /r /t 00
:13
cls
SYSTEMINFO.exe
echo:
<nul set /p "=Done reading/checking? Press a key to proceed..."
pause >nul
goto start
:14
cls
echo:
echo:
echo                          ^|                     Show (Curent) Windows Directory                   ^|
echo                          ^| This is the folder where Windows is installed to. It contains all     ^|
echo                          ^| Windows files for the complete system You may need to check the       ^|
echo                          ^| current directory for some reason.                                    ^|
echo                          ^|                                                                       ^|
echo                          ^|                                                                       ^|
echo                          ^|                 Your curent Windows directory is in:                  ^|
echo                          ^|                              '%windir%'!                            ^|
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
echo                          ^|                                                                       ^|
echo:
<nul set /p "=Done reading/checking? Press a key to proceed..."
pause >nul
goto start
:15
cls
set /p force_del_temp=Do you want to force the deletion of all temporary files? This can make currently running programs make run incorrectly. [Y/N] 
if %force_del_temp%==y goto 15_forced
if %force_del_temp%==Y goto 15_forced
if %force_del_temp%==n goto 15_unforced
if %force_del_temp%==N goto 15_unforced
set back_to_15=1
goto invalid_task
:15_forced
cls
del /f "%TMP%\*"
if %errorlevel%==1 echo Some/No files have been force cleared!
if %errorlevel%==0 echo The temporary directory has been force cleared!
<nul set /p "=Done reading/checking the cleared temporary files? Press a key to proceed..."
pause >nul
goto start
:15_unforced
cls
del "%TMP%\*"
if %errorlevel%==1 echo Some/No files have been unforce cleared!
if %errorlevel%==0 echo The temporary directory has been unforce cleared!
<nul set /p "=Done reading/checking the cleared temporary files? Press a key to proceed..."
pause >nul
goto start
:16
:17
:18
:19
:20
:21
:22
:23
:24
:25
:26
:27
:28
:29
:30
:31
:32
:33
:34
:35
:36
:37
:error
pause
goto %task%
