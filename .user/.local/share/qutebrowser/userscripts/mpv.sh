#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/mpv.sh ::

cd "$QUTE_DOWNLOAD_DIR"
file_dl="$(yt-dlp --restrict-filenames --get-filename "$QUTE_URL")"

if [ -z "$file_dl" ]; then
    printf 'message-error "yt-dlp: unsupported URL: %s"\n' "$QUTE_URL" > "$QUTE_FIFO"
    exit 0
fi

if [ -e "$file_dl" ]; then
    printf 'message-info "mpv: %s"\n' "$file_dl" > "$QUTE_FIFO"
    mpv "$file_dl"
else
    printf 'message-info "mpv: %s"\n' "$QUTE_URL" > "$QUTE_FIFO"
    mpv "$QUTE_URL"
fi
