@echo off
REM Setting up dotfiles on windows

echo "You must run setup.bat using an elevated privileges console!"
set dotdir=%~dp0
set home=%USERPROFILE%

REM Set necessary env variables
setx HOME %USERPROFILE%
setx PATH "%PATH%

set SDKHOME=c:\dev
if not exist %DEVHOME% set SDKHOME=d:\dev


echo Dev Home is %DEVHOME%

REM SymLinks for bash and readline
mklink %home%\.bash_aliases %dotdir%\bash_aliases
mklink %home%\.inputrc %dotdir%\inputrc
mklink %home%\.bash_profile %dotdir%\bash_profile
mklink %home%\.bashrc %dotdir%\bashrc
mklink %home%\.minttyrc %dotdir%\.minttyrc
mklink %home%\.gitignore %dotdir%\gitignore

REM SymLink for Scite
mklink %home%\SciTEUser.properties %dotdir%\SciTEUser.properties

REM symlink remap.ahk in startup directory
mklink "%home%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk" "%dotdir%\remap.ahk"



REM SymLinks for finding .vimrc and .vim
mklink %home%\.vimrc %dotdir%\vimrc
mklink /d %home%\vimfiles %dotdir%\vim
mklink /d %home%\.vim %dotdir%\vim


icacls vim /setowner %USERNAME%
icacls . /grant %USERNAME%:F

