@echo off
setlocal enabledelayedexpansion

for /f "tokens=1,2,3 delims=." %%a in (version.txt) do (
    set MAJOR=%%a
    set MINOR=%%b
    set /a PATCH=%%c+1
)

(echo !MAJOR!.!MINOR!.!PATCH!)> version.txt

git add -A
git commit -m "release: update installer v!MAJOR!.!MINOR!.!PATCH!"
git push origin master

echo Done! Pushed v!MAJOR!.!MINOR!.!PATCH!
pause