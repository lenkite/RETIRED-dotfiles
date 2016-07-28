# DEPRECATED
This project has been deprecated. With the windows subsystem for Linux, one can now have a common dotfiles across multiple OSe's.
- See sorin-ionescu/prezto for ZSH configuration
- See luan/vimfiles for best of breed vim/neovim setup and vim/neovim plugins

# SETUP
- Clone this repository into your home directory - it should be at path ~/dotfiles
- Disable Antivirus if you prefer speed of installation.
- Download cygwin `setup-x86.exe` here.
- Open DOS Command Prompt and run cygwinsetup.bat. If you wish to run cygwinsetup.bat with no proxy then invoke cygwinsetup.bat with "-noproxy" command line parameter.
- If you are on windows run `init.bat` in `ADMINISTRATO`R mode command prompt. (This guy creates the hard links to the dotfiles directory. Ex: from .bashrc to dotfiles/.bashrc, changes shell and fixes home directory in /etc/passwd etc)
- Setup mintty shortcut
- Then open up cygwin, navigate here and run `setup.zsh`. User can choose to run `setup.zsh` with `-noproxy` option.
- Modify `env/gitenv-sap`, `env/gitenv-hub` with your git environment setup
- Before doing GIT development run the shell function `gitenv-hub()` or `gitenv-sap()`. This will
source the relevant git file.
- `vundle` is used as the VIM package manager. In order for vundle to work properly behind a proxy, ensure that `git config --global https.proxy` and `git config --global http.proxy` are set correctly
- Open vim and issue `PluginInstall` command
- That's all for now.

## TIPS
- CD automatically pushes directory onto stack
- You can use cd - to toggle between first two directories on stack
- You can use cd [+-]N to move to Nth directory on stack (from top or bottom)
- You can define mydir=<path> and use cd mydir to jump to mydir. To get automcomplete of named directories you can cd ~my<TAB> and list all your named directories starting with my.
- Use dirs or dv (alias) to list directories on stack.
- Type zmv command and see http://www.refining-linux.org/archives/36/ZSH-Gem-1-Programmable-file-renaming/
- The screen command will have two screens with split windows with bottom one slightly smaller than top
- See http://unix.stackexchange.com/questions/7453/linux-how-to-split-the-terminal-into-more-than-one-view
- For screen sessions, Use CTRL-a CTRL-a to toggle and CTRL-a K to kill and CTRL-a \ to kill all 
- Use CTRL-a a prefix for a nested screen sequence
- Use 'winkill' alias on cygwin to kill processes by name. Ex: 'winkill notepad.exe'
- Use 'z' for AMAZING, intelligent, CD'ing. Read README at https://github.com/rupa/z/
- Use 'ack' instead of 'grep' to search.
  See http://stevengharms.com/use-ack-instead-of-grep-to-parse-text-files

