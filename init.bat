@echo off
REM Setting up dotfiles on windows

echo "You must run init.bat using an elevated privileges console!"
set dotdir=%~dp0
set home=%USERPROFILE%

REM Set necessary env variables
setx HOME %USERPROFILE%
setx PATH "%PATH%

set SDKHOME=c:\dev
if not exist %SDKHOME% set SDKHOME=d:\dev


echo Dev Home is %DEVHOME%

REM SymLinks for bash and readline
del /q %home%\.bash_aliases
del /q %home%\.inputrc
mklink %home%\.inputrc %dotdir%\inputrc
del /q %home%\.bash_profile
REM mklink %home%\.bash_profile %dotdir%\bash_profile
del /q %home%\.zprofile
mklink %home%\.zprofile %dotdir%\zprofile
del /q %home%\.bashrc
mklink %home%\.bashrc %dotdir%\bashrc
del /q %home%\.zshrc
mklink %home%\.zshrc %dotdir%\zshrc
del /q %home%\.minttyrc
del /q %home%\minttyrc
mklink %home%\.minttyrc %dotdir%\minttyrc
del /q %home%\.gitignore
REM mklink %home%\.gitignore %dotdir%\gitignore
del /q %home%\.screenrc
mklink %home%\.screenrc %dotdir%\screenrc

REM SymLink for Scite
del /q %home%\SciTEUser.properties
mklink %home%\SciTEUser.properties %dotdir%\SciTEUser.properties

REM symlink remap.ahk in startup directory
del /q "%home%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk"
mklink "%home%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk" "%dotdir%\remap.ahk"


REM SymLinks for finding .vimrc and .vim
del /q %home%\.vimrc
mklink %home%\.vimrc %dotdir%\vimrc
rmdir /q %home%\vimfiles
mklink /d %home%\vimfiles %dotdir%\vim
rmdir /q %home%\.vim
mklink /d %home%\.vim %dotdir%\vim

call BatchSubstitute.bat "/home/%USERNAME%" "/cygdrive/c/Users/%USERNAME%" c:\sdk\cygwin\etc\passwd > %TEMP%\passwd1
call BatchSubstitute.bat "/bin/bash" "/bin/zsh" %TEMP%\passwd1 > %TEMP%\passwd2
copy %TEMP%\passwd2 c:\sdk\cygwin\etc\passwd

icacls vim /setowner %USERNAME%
icacls . /grant %USERNAME%:F

icacls c:\sdk\cygwin\etc\passwd /setowner %USERNAME%
icacls c:\sdk\cygwin\etc\passwd  /grant %USERNAME%:F
