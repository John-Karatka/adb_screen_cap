@echo off
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i
set timestamp=%datetime:~2,6%_%datetime:~8,6%
echo Starting...
ADB\adb shell screencap -p /sdcard/screenshot.png
ADB\adb pull /sdcard/screenshot.png pictures\%timestamp%.png
echo Done