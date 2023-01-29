@echo off
set batch_path=^"D:\a\Windows_All-In-One_Tool\Windows_All-In-One_Tool\src\Windows All-In-One Tool.bat^"
echo Starting %batch_patch% for a test...
"D:\a\Windows_All-In-One_Tool\Windows_All-In-One_Tool\src\Windows All-In-One Tool.bat"
if errorlevel 255 (
echo The program ran successfully!
)
echo Exiting...
timeout /t 3 > nul
exit /b 0
