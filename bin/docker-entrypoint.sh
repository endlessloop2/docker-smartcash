#!/bin/bash
set -x

USER=smartcash

chown -R ${USER} .
exec gosu ${USER} "$@"
