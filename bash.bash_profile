#!/usr/bin/env bash

. $HOME/.set_mydir

eval "$(/opt/homebrew/bin/brew shellenv)"

VIRTUAL_ENV_DISABLE_PROMPT=1
. "$MYDIR/dev/py_venv/bin/activate"

export PATH="$MYDIR/dev/bin:$PATH"

function runemacs() { emacs --eval '(select-frame-set-input-focus (selected-frame))' "$@" & }

export BASH_SILENCE_DEPRECATION_WARNING=1

bind 'set mark-symlinked-directories on'
