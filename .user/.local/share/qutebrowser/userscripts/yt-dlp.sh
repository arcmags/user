#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/yt-dlp.sh ::

cd "$QUTE_DOWNLOAD_DIR"
file_dl="$(yt-dlp --restrict-filenames --get-filename "$QUTE_URL")"

if [ -z "$file_dl" ]; then
    printf 'message-error "yt-dlp: unsupported URL: %s"' "$QUTE_URL" > "$QUTE_FIFO"
    exit 0
elif [ -e "$file_dl" ]; then
    printf 'message-info "yt-dlp: %s [100%%]"' "$file_dl" > "$QUTE_FIFO"
    exit 0
fi

printf 'message-info "yt-dlp: %s [starting...]"' "$file_dl" > "$QUTE_FIFO"
yt-dlp --restrict-filenames "$QUTE_URL"

if [ $? -eq 0 ]; then
    size="$(du -hs "$file_dl" | cut -f1)"
    printf 'message-info "yt-dlp: %s [100%%|%s]"' "$file_dl" "$size" > "$QUTE_FIFO"
else
    printf 'message-error "yt-dlp: %s [error]"' "$QUTE_URL" > "$QUTE_FIFO"
fi
