REM See http://cygwin.com/faq/faq.setup.html#faq.setup.cli
REM See cygwin package list at: http://cygwin.com/packages/
set targetdrive=c:
set localpkgdir=%targetdrive%\sdk\cygwin_packages
set installdir=%targetdrive%\sdk\cygwin
RD /S /Q %localpkgdir%
RD /S /Q %installdir%
rm /q setup.log
rm /q setup.log.full
rd /q /s http%3a*
rmdir %localpkgdir%
mkdir %installdir%
setup.exe ^
--disable-buggy-antivirus ^
--proxy proxy.wdf.sap.corp:8080 ^
--local-package-dir %localpkgdir% ^
--root %installdir% ^
--quiet-mode ^
--only-site ^
--site http://mirrors.kernel.org/sourceware/cygwin/ ^
--packages ^
astyle,^
git,^
git-completion,^
git-gui,^
aview,^
aalib,^
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
run2,^
screen,^
sed,^
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
echo After installation go to last line in %installdir%\etc\passwd and change /home/<userid> to /cygdrive/c/Users/<userId>. Also make userId smallcased
