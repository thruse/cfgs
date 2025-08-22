#!/usr/bin/env bash

if [ -n "$SHIN" ] ; then
    . "$HOME/.bashrc"
    exit 0
fi

. "$HOME/.setdirs"

. "$CFGSDIR/envin"

bind 'set mark-symlinked-directories on'

if [ -f "$DEVDIR/cfgs/local" ] ; then
    . "$DEVDIR/cfgs/local"
fi

cd "$DEVDIR"

