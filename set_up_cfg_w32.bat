@echo off

if defined my_directory goto set_up else goto error_my_directory

:set_up


mkdir "%userprofile%\appdata\roaming\.emacs.d\baks"
mkdir "%userprofile%\appdata\roaming\.emacs.d\autosaves"
type nul > "%userprofile%\appdata\roaming\.emacs.d\custom.el"
mklink "%userprofile%\appdata\roaming\.emacs.d\init.el" "%my_directory%\dev\cfgs\emacsinit.el"

mklink "%userprofile%\.gitconfig" "%my_directory%\dev\cfgs\git.gitconfig"

mklink "%userprofile%\appdata\local\nvim\init.vim" "%my_directory%\dev\cfgs\nviminit.vim"

goto :eof

:error_my_directory
echo error: my_directory not defined

