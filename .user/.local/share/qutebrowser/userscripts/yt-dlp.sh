#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/yt-dlp.sh ::

cd "$QUTE_DOWNLOAD_DIR"
file_dl="$(yt-dlp --restrict-filenames --get-filename "$QUTE_URL")"

if [ -z "$file_dl" ]; then
    printf 'message-error "yt-dlp: unsupported URL: %s"\n' "$QUTE_URL" > "$QUTE_FIFO"
    exit 0
elif [ -e "$file_dl" ]; then
    printf 'message-info "yt-dlp: %s [100%%]"\n' "$file_dl" > "$QUTE_FIFO"
    exit 0
fi

printf 'message-info "yt-dlp: %s"\n' "$file_dl" > "$QUTE_FIFO"
if yt-dlp --restrict-filenames "$QUTE_URL"; then
    size="$(du -hs "$file_dl" | cut -f1)"
    printf 'message-info "yt-dlp: %s [100%%|%s]"\n' "$file_dl" "$size" > "$QUTE_FIFO"
else
    printf 'message-error "yt-dlp: %s [error]"\n' "$QUTE_URL" > "$QUTE_FIFO"
fi
