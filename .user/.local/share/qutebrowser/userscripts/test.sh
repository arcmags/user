#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/mpv.sh ::

for ((i=0;i<4;i++)); do
    printf 'message-info "test [%02d]"' "$i" > "$QUTE_FIFO"
    sleep 2
done
