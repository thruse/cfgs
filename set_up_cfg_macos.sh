#!/bin/bash
# Initialise Cfgs for MacOS

ln -s "$HOME/dev/cfgs/bash.bash_profile" "$HOME/.bash_profile"

mkdir -p "$HOME/.emacs.d/baks"
mkdir -p "$HOME/.emacs.d/autosaves"
touch "$HOME/.emacs.d/custom.el"
ln -s "$HOME/dev/cfgs/emacsinit.el" "$HOME/.emacs.d/init.el"

ln -s "$HOME/dev/cfgs/git.gitconfig" "$HOME/.gitconfig"

mkdir -p "$HOME/.config/nvim"
ln -s "$HOME/dev/cfgs/nviminit.vim" "$HOME/.config/nvim/init.vim"

