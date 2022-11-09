#!/bin/sh

if [ ! -d "/tmp/check" ]; then
    mkdir /tmp/check
    git config --global --add safe.directory /home
    exec "$@"
else
    exec "$@"
fi
