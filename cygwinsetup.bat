@echo off
REM See http://cygwin.com/faq/faq.setup.html#faq.setup.cli
REM See cygwin package list at: http://cygwin.com/packages/

set dotdir=%~dp0
set home=%USERPROFILE%
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate. Kindly run with Administrative privilege
        exit /B
    )

echo **Ensure that you are running with Administrator privilege
choice /c:CDE /M "Enter cygwin/tools install drive: "
if  ERRORLEVEL 3 goto :edrive
if  ERRORLEVEL 2 goto :ddrive
if  ERRORLEVEL 1 goto :cdrive
:edrive
echo Target drive is E:
set targetdrive=E:
goto :proxy
:ddrive
echo Target drive is D:
set targetdrive=D:
goto :proxy
:cdrive
echo Target drive is C:
set targetdrive=C:
goto :proxy

:proxy
echo Target install drive is %targetdrive%

if not defined http_proxy (
    echo HTTP Proxy not set. Defaulting to proxy.wdf.sap.corp:8080 
    set http_proxy=proxy.wdf.sap.corp:8080
)
echo Setting https proxy to same as http proxy
set https_proxy=%http_proxy%
set localpkgdir=%targetdrive%\sdk\cygwin_packages
set installdir=%targetdrive%\sdk\cygwin
set cyghome=%installdir%
echo Attempting to KILL active cygwin processes...
taskkill /t /f /im  mintty.exe 2>nul
taskkill /t /f /im  ssh-agent.exe 2>nul
taskkill /t /f /im  bash.exe  2>nul
taskkill /t /f /im  zsh.exe  2>nul
taskkill /t /f /im  vim.exe  2>nul
taskkill /t /f /im  sublime_text.exe  2>nul
taskkill /t /f /im  git-credential-cache--daemon.exe   2>nul

:sethomesdkvars
set SDKHOME=%targetdrive%\sdk
if not exist %SDKHOME% (
 mkdir %SDKHOME%
)
echo SDK HOME is %SDKHOME%
set SDKTOOLS=%SDKHOME%\tools
if not exist %SDKTOOLS% mkdir %SDKTOOLS%
echo Granting permission to %SDKTOOLS% 
echo SDKTOOLS is %SDKTOOLS%

:getwget
if not exist %SDKTOOLS%\wget.exe (
    echo Downloading wget into %SDKTOOLS% ..
    cmd /c bitsadmin /Transfer WGetExeDownload /priority high http://users.ugent.be/~bpuype/wget/wget.exe %SDKTOOLS%\wget.exe
    if not exist %SDKTOOLS%\wget.exe (
        echo FATAL: Could not download wget into %SDKTOOLS%. Terminating
        exit /B
    ) else (
        echo SUCCESS: Downloaded windows wget into %SDKTOOLS%
    )
)
set wget=%SDKTOOLS%\wget.exe

:getunzip
set unzip=%SDKTOOLS%\unzip.exe
if not exist %unzip% (
    echo Downloading unzip.exe into %unzip%
    wget http://www2.cs.uidaho.edu/~jeffery/win32/unzip.exe -O %unzip%
    if not exist %unzip% (
        echo FATAL: Could not download unzip.exe . Terminating
        exit /B
    ) else (
        echo SUCCESS: Downloaded unzip.exe wget into %SDKTOOLS%
    )
)

:getctags
set ctags=%SDKTOOLS%\ctags.exe
if not exist %ctags% (
    echo Downloading ctags.exe into %ctags%
    wget http://dfn.dl.sourceforge.net/project/ctags/ctags/5.8/ctags58.zip -O %ctags%
    if not exist %ctags% (
        echo FATAL: Could not download ctags.exe . Terminating
        exit /B
    ) else (
        echo SUCCESS: Downloaded ctags.exe ctags into %SDKTOOLS%
    )
)

:clearcyg
SETLOCAL EnableDelayedExpansion
if exist "%installdir%" (
        ::SET /P clearins="Do you want to clear %installdir% Y/N?"
        choice /M "Do you want to clear %installdir% ?"
        if !ERRORLEVEL! == 1 (
            echo CLEARING %installdir% ...
            RD /S /Q %installdir%
        )
        choice /M "Do you want to clear %localpkgdir% ?"
        if !ERRORLEVEL! == 1 (
            RD /S /Q %localpkgdir%
            if exist http%3a* (
                RD /q /s 
                )
            )
)
if exist setup.log (
    echo CLEARING log files...
    DEL /q setup.log
    DEL /q setup.log.full
)
if not exist %installdir% mkdir %installdir%
if not exist setup.exe  (
        echo WARN: cygwin setup.exe NOT found in current directory! Attempting to download via wget...
        call %wget% http://www.cygwin.com/setup.exe 
        if NOT ERRORLEVEL 0 (
            echo ERROR: Could not download cygwin setup.exe. Terminating
            exit /B
        )
)
if not defined skipsetup (
    if exist %localpkgdir% rmdir %localpkgdir%
    echo INVOKING cygwin setup.exe...
setup.exe ^
--disable-buggy-antivirus ^
--proxy %http_proxy% ^
--local-package-dir %localpkgdir% ^
--root %installdir% ^
--quiet-mode ^
--only-site ^
--site http://mirrors.kernel.org/sourceware/cygwin/ ^
--packages ^
apt-cyg,^
astyle,^
git,^
git-completion,^
git-gui,^
aview,^
aalib,^
gcc4-core,^
gitk,^
ncurses,^
ncursesw,^
wget,^
which,^
wput,^
vim,^
wcd,^
wtf,^
aria2,^
ascii,^
attr,^
bash-completion,^
bashdb,^
bvi,^
bzip2,^
ca-certificates,^
cabextract,^
cadaver,^
catdoc,^
cdargs,^
chere,^
cloc,^
colordiff,^
convmv,^
coreutils,^
connect-proxy,^
corkscrew,^
cpio,^
crypt,^
csih,^
ctags,^
curl,^
cvs,^
cygutils,^
cygrunsrv,^
ddd,^
dhttpd,^
dialog,^
diffutils,^
dog,^
dos2unix,^
editrights,^
fcrackzip,^
fdupes,^
figlet,^
file,^
flip,^
gamin,^
gawk,^
geoip,^
fortune,^
gnugo,^
gnuplot,^
greed,^
gperf,^
grep,^
googlecl,^
gnubg,^
hexedit,^
httperf,^
httping,^
httptunnel,^
inetutils,^
integrit,^
indent,^
ipcalc,^
iperf,^
iprint,^
irssi,^
iselect,^
lcab,^
less,^
lftp,^
lighttpd,^
lilypond,^
lilypond-doc,^
links,^
login,^
lzip,^
makepasswd,^
makeself,^
man,^
mc,^
mcrypt,^
md5deep,^
micro-httpd,^
mintty,^
mmv,^
multitail,^
ncdu,^
ncftp,^
neon,^
netcat,^
netpbm,^
nfs-server,^
nttcp,^
ninvaders,^
openldap,^
openssh,^
openssl,^
p7zip,^
pal,^
patch,^
patchutils,^
pbzip2,^
pcre,^
perl,^
ploticus,^
ploticus-doc,^
plotutils,^
popt,^
potrace,^
psmisc,^
pwget,^
pwgen,^
python,^
python-doc,^
rebase,^
robots,^
rsh,^
rsh-server,^
rsync,^
ruby,^
run2,^
screen,^
sed,^
siege,^
sgrep,^
sharutils,^
shutdown,^
since,^
socat,^
source-highlight,^
sng,^
subversion,^
subversion-tools,^
stow,^
sudoku,^
tar,^
task,^
terminfo,^
tidy,^
tig,^
time,^
ttcp,^
ttyrec,^
typespeed,^
txt2regex,^
ucspi-tcp,^
udunits,^
units,^
unzip,^
upx,^
urlgrabber,^
util-linux,^
uw-imap-util,^
vfu,^
w3m,^
wdiff,^
xmlto,^
xxd,^
xtail,^
zip,^
zsync,^
zsh
REM echo After installation go to last line in %installdir%\etc\passwd and change /home/<userid> to /cygdrive/c/Users/<userId>. Also make userId smallcased
)

:checkcyginstall
if not exist %cyghome%\bin\cygwin1.dll (
    echo ERROR: Cygwin wasn't installed. Exiting
    exit /B
)
echo Checking whether cygwin is already in path...
call findinpath.bat  %cyghome%
if errorlevel 1 (
    echo Adding CYGHOME to path
    setx PATH="%PATH%;%cyghome%\bin"
) else (
    echo CYGHOME already in path
)
echo Attempting to locate git binary in path ...
where git >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Found Git in Path.
) else (
    echo Error: Cannot find git in path!
)

:shellpass
set homeletter=%HOME:~0,1%
echo Setting your home directory in Cygwin's /etc/passwd and ZSH shell
call BatchSubstitute.bat "/home/%USERNAME%" "/cygdrive/%homeletter%/Users/%USERNAME%" %cyghome%\etc\passwd > %TEMP%\passwd1
call BatchSubstitute.bat "/bin/bash" "/bin/zsh" %TEMP%\passwd1 > %TEMP%\passwd2
copy %TEMP%\passwd2 %cyghome%\etc\passwd

:shellsetup
del /q %home%\.bash_aliases >nul 2>&1
del /q %home%\.inputrc >nul 2>&1
mklink %home%\.inputrc %dotdir%\inputrc
del /q %home%\.bash_profile >nul 2>&1
del /q %home%\.zprofile >nul 2>&1
mklink %home%\.zprofile %dotdir%\zprofile
del /q %home%\.bashrc >nul 2>&1
mklink %home%\.bashrc %dotdir%\bashrc
del /q %home%\.zshrc >nul 2>&1
mklink %home%\.zshrc %dotdir%\zshrc
del /q %home%\.minttyrc >nul 2>&1
del /q %home%\minttyrc >nul 2>&1
mklink %home%\.minttyrc %dotdir%\minttyrc
del /q %home%\.gitignore >nul 2>&1
del /q %home%\.screenrc >nul 2>&1
mklink %home%\.screenrc %dotdir%\screenrc

:scitesetup
del /q %home%\SciTEUser.properties >nul 2>&1
mklink %home%\SciTEUser.properties %dotdir%\SciTEUser.properties

:remap
del /q "%home%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk" >nul 2>&1
mklink "%home%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk" "%dotdir%\remap.ahk"


:spf13
REM spf13 unfortunately sucks :(
goto :vimlinks
if not defined skipspf13 ( 
    set spf13inst=%TEMP%/spf13-vim-windows-install.cmd
    del /q %spf13inst% >nul 2>&1
    echo Downloading SPF13 ULTIMATE VIM installer...
    call %wget% --no-check-certificate https://raw.github.com/spf13/spf13-vim/3.0/spf13-vim-windows-install.cmd -O %spf13inst%
    if ERRORLEVEL 0 (
        echo Clearing vim dotfiles/dirs ...
        del /q %home%\.vimrc
        del /q %home%\_vimrc
        rmdir /q %home%\vimfiles
        rmdir /q %home%\.vim
        call %spf13inst% 
    ) else (
        echo ERROR: Failed to download spf13installer.
        exit /B
    )
)

:vimlinks
del /q %home%\.vimrc >nul 2>&1
mklink %home%\.vimrc %dotdir%\vimrc 
del /q %home%\_vimrc >nul 2>&1
mklink %home%\_vimrc %dotdir%\vimrc 
rmdir /q %home%\vimfiles >nul 2>&1
mklink /d %home%\vimfiles %dotdir%\vim
rmdir /q %home%\.vim >nul 2>&1
mklink /d %home%\.vim %dotdir%\vim

:st3links
REM mklink /d %home%\st3\user C:\Users\i034796\AppData\Roaming\Sublime Text 3\Packages\User
set st3user="C:\Users\i034796\AppData\Roaming\Sublime Text 3\Packages\User"
rmdir /s /q %st3user%
mklink /d %st3user% %dotdir%st3\user

:setenv
echo Setting HOME, SDKHOME, SDKTOOLS as system env variables
setx HOME %USERPROFILE%
setx SDKHOME %SDKHOME%
setx SDKTOOLS %SDKTOOLS%
echo Checking if SDKTOOLS is in PATH...
call findinpath.bat  %SDKTOOLS%
if errorlevel 1 (
    echo Adding SDKTOOLS to system PATH since not present ..
    setx PATH "%PATH%;%SDKTOOLS%"
) else (
    echo SDKTOOLS already in system PATH
)

:setperm
echo Setting permissions on various files
icacls %SDKTOOLS% /grant %USERNAME%:F
icacls %dotdir% /grant %USERNAME%:F
if exist vim icacls vim /setowner %USERNAME%
icacls %cyghome%\etc\passwd /setowner %USERNAME%
icacls %cyghome%\etc\passwd  /grant %USERNAME%:F

goto :eof




