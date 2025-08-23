#!/usr/bin/env bash

. "$HOME/.setdirs"

. "$CFGSDIR/envin"

if [ -f "$DEVDIR/cfgs/local" ] ; then
    . "$DEVDIR/cfgs/local"
fi

case "$-" in
    *i*)
        . "$HOME/.bashrc"
        if [ -z "$SHIN" ] ; then
            cd "$DEVDIR"
        fi
        ;;
esac

export SHIN=1

