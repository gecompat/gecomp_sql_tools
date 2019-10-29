@echo off
git add .
echo.
git status
echo.
echo.

set /p msg="Enter Commit Message: "

git commit -m "%msg%"
git push
echo.
echo.
pause