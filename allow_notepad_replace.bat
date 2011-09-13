@echo off
echo "Run me with Admin privileges"
cd c:\Windows
takeown /f notepad.exe
icacls notepad.exe /grant %USER%:F
