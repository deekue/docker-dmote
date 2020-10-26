#!/usr/bin/env bash
#
# wrapper script for running DMOTE in Docker

SRCDIR=$HOME/src/dactyl-keyboard

docker run  \
  -v "${SRCDIR}:/opt" \
  -e UID=`id -u` -e GID=`id -g` \
  --rm -it deekue/dmote \
  "$@"
