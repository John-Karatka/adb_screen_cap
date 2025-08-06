@echo off
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i
set timestamp=%datetime:~2,6%_%datetime:~8,6%
echo Starting...
start "ScreenRecordWindow" cmd /C "ADB\adb shell screenrecord /sdcard/screenrecord.mp4"
start /wait ADB\scrcpy.exe
taskkill /FI "WINDOWTITLE eq ScreenRecordWindow" /T /F
timeout /t 2 >nul
ADB\adb pull /sdcard/screenrecord.mp4 videos\%timestamp%.mp4
echo Done