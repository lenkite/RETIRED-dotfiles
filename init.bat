@echo off
REM Setting up dotfiles on windows

echo "You must run init.bat using an elevated privileges console!"
set dotdir=%~dp0
set home=%USERPROFILE%

REM Set necessary env variables
setx HOME %USERPROFILE%
REM setx PATH "%PATH%"
setx dotfiles "%dotdir%"

set SDKHOME=c:\sdk
if not exist %SDKHOME% set SDKHOME=d:\sdk
mkdir %SDKHOME%
if not exist %SDKHOME% set SDKHOME=c:\sdk

set cyghome=%SDKHOME%\cygwin

echo Dev Home is %DEVHOME%

REM SymLinks for bash and readline
del /q %home%\.bash_aliases
del /q %home%\.inputrc
mklink %home%\.inputrc %dotdir%\inputrc
del /q %home%\.bash_profile
REM mklink %home%\.bash_profile %dotdir%\bash_profile
del /q %home%\.zprofile
del /q %home%\.zshenv
mklink %home%\.zshenv %dotdir%\zshenv
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

call BatchSubstitute.bat "/home/%USERNAME%" "/cygdrive/c/Users/%USERNAME%" %cyghome%\etc\passwd > %TEMP%\passwd1
call BatchSubstitute.bat "/bin/bash" "/bin/zsh" %TEMP%\passwd1 > %TEMP%\passwd2
copy %TEMP%\passwd2 %cyghome%\etc\passwd

icacls vim /setowner %USERNAME%
icacls . /grant %USERNAME%:F

icacls %cyghome%\etc\passwd /setowner %USERNAME%
icacls %cyghome%\etc\passwd  /grant %USERNAME%:F
