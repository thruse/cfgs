#!/usr/bin/env bash

. "$HOME/.setdirs"

. "$CFGSDIR/envin"

bind 'set mark-symlinked-directories on'

if [ -f "$DEVDIR/cfgs/local" ] ; then
    . "$DEVDIR/cfgs/local"
fi

cd "$DEVDIR"

