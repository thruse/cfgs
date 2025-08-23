#!/usr/bin/env bash

eval "$(/opt/homebrew/bin/brew shellenv)"

case "$-" in
    *i*)
        . "$HOME/setdirs"

        . "$CFGSDIR/envin"

        if [ -f "$CFGSDIR/local_profile" ] ; then
            . "$CFGSDIR/local_profile"
        fi

        . "$HOME/.bashrc"
        ;;
esac

