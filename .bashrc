#!/usr/bin/env bash

case "$-" in
    *i*)
        bind 'set mark-symlinked-directories on'
        if [ -z "$SHIN" ] ; then
            cd "$DEVDIR"
            export SHIN=1
        fi
        ;;
esac

