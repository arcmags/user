#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/vim.sh ::
# Download $1 to temp file and open in xterm vim.

set -e

if [ -z "$1" ]; then
    exit 0
fi

mkdir -p /tmp/web-dl
file_tmp="$(mktemp -p /tmp/web-dl)"

if curl -s "$1" > "$file_tmp"; then
    exec xterm -T 'xterm_float' -e vim "$file_tmp"
else
    rm -f "$file_tmp"
fi
