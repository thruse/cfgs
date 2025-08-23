#!/usr/bin/env bash

case "$-" in
    *i*)
        bind 'set mark-symlinked-directories on'
        ;;
esac

