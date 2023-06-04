@echo off
echo Upgrading apps...
echo.
call scoop update *
echo.
echo Cleaning apps...
echo.
call scoop cleanup *
echo.
pause
exit