@echo off
echo "%PATH%" | findstr /C:%1% >nul 2>&1
if errorlevel 1 (
	echo Did not find %1% in PATH
	exit /B 1
) else (
	echo Found %1% in PATH
	exit /B 0
)
