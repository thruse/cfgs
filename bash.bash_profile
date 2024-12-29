#!/usr/bin/env bash

. "$HOME/.set_mydir"

cd "$MYDIR/dev"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$MYDIR/dev/bin:$PATH"

VIRTUAL_ENV_DISABLE_PROMPT=1
. "$MYDIR/dev/venv/bin/activate"
unset VIRTUAL_ENV_DISABLE_PROMPT

function runemacs() { (emacs --eval '(select-frame-set-input-focus (selected-frame))' "$@" &) }

export BASH_SILENCE_DEPRECATION_WARNING=1
bind 'set mark-symlinked-directories on'
