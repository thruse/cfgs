#!/bin/bash

# Add homebrew things to PATH.
eval "$(/opt/homebrew/bin/brew shellenv)"

# personal things; bash; VS Code; homebrew, Git, R; TeX Live; Emacs; Neovim; Java 8 u291;
export PATH="$HOME/dev/bin:/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/opt/homebrew:/Library/TeX/texbin:/Applications/Emacs.app/Contents/MacOS:/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home/bin:$PATH"

# Some other PATH values are set in `/etc/paths.d`.

# Start emacs with focus and allow commands to keep being sent from the terminal.
function runemacs() { emacs --eval '(select-frame-set-input-focus (selected-frame))' "$@" & }

# Don't give the "use zsh instead" complaint
export BASH_SILENCE_DEPRECATION_WARNING=1

# Put the trailing / when using tab to autocomplete symlinked directories
bind 'set mark-symlinked-directories on'
