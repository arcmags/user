#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/vim.sh ::

if [ "$QUTE_MODE" = 'command' ]; then
    printf 'message-info "vim: %s %s"\n' "$QUTE_HTML" "$QUTE_TEXT" > "$QUTE_FIFO"
    xterm -T 'xterm_float' -e vim "$QUTE_HTML" "$QUTE_TEXT"
else
    file_tmp="$(mktemp)"
    printf 'message-info "curl & vim: %s"\n' "$QUTE_URL" > "$QUTE_FIFO"
    curl -s "$QUTE_URL" > "$file_tmp" && xterm -T 'xterm_float' -e vim "$file_tmp"
    rm -f "$file_tmp"
fi
