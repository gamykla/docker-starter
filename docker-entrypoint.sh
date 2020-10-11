#!/bin/sh

set -ex
echo "docker entrypoint..."
if [ "$1" = 'boot' ]; then
    echo "command: boot"
    # start app here
    exit $?
fi

exec "$@"
