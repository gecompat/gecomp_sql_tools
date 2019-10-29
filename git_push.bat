@echo off
git add .
echo.
git status
echo.
pause

set /p msg="Enter Commit Message: "

git commit -m "%msg%"
git push
echo.
pause