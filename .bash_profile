#!/usr/bin/env bash

. "$HOME/.setdirs"

cd "$DEVDIR"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$DEVDIR/bin:$PATH"

. "$DEVDIR/.venv/bin/activate"
export PS1=$_OLD_VIRTUAL_PS1

runemacs ()
{
    ( emacs --eval '(select-frame-set-input-focus (selected-frame))' "$@" & )
}

export BASH_SILENCE_DEPRECATION_WARNING=1
bind 'set mark-symlinked-directories on'

