#!/bin/bash
#
# set up a user and switch to that user

set -euo pipefail

UID="${UID:-1000}"
GID="${GID:-1000}"

groupadd -o -g "${GID}" user
useradd --shell /bin/bash -u "${UID}" -g "${GID}" -o -c "" -m user
export HOME=/home/user

exec /usr/sbin/gosu user "$@"
