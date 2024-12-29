#!/usr/bin/env bash

. "$HOME/.setdirs"

cd "$DEVDIR"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$DEVDIR/bin:$PATH"

VIRTUAL_ENV_DISABLE_PROMPT=1
. "$DEVDIR/.venv/bin/activate"
unset VIRTUAL_ENV_DISABLE_PROMPT

function runemacs() { (emacs --eval '(select-frame-set-input-focus (selected-frame))' "$@" &) }

export BASH_SILENCE_DEPRECATION_WARNING=1
bind 'set mark-symlinked-directories on'
