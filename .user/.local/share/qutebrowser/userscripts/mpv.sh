#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/mpv.sh ::

cd "$QUTE_DOWNLOAD_DIR"
file_dl="$(yt-dlp --restrict-filenames --get-filename "$QUTE_URL")"

if [ -z "$file_dl" ]; then
    printf 'message-error "yt-dlp: unsupported URL: %s"' "$QUTE_URL" > "$QUTE_FIFO"
    exit 0
fi

printf 'message-info "mpv: %s"' "$file_dl" > "$QUTE_FIFO"
if [ -e "$file_dl" ]; then
    mpv "$file_dl"
else
    mpv "$QUTE_URL"
fi
