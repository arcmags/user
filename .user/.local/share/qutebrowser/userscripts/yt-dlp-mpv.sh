#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/yt-dlp-mpv.sh ::

flag_dl="${flag_dl:-true}"
flag_play="${flag_play:-true}"

cd "$QUTE_DOWNLOAD_DIR"

file="$(yt-dlp -o '%(title)s.%(ext)s' --get-filename "$QUTE_URL" | \
    sed -E -e 's/[^A-Za-z0-9_.-]//g' -e 's/_{2,}/_/g' -e 's/[_-]{2,}/-/g')"

if [ -z "$file" ]; then
    printf 'message-error "yt-dlp: unsupported URL: %s"\n' "$QUTE_URL" > "$QUTE_FIFO"
    exit 0
fi

if [ "$flag_dl" = 'true' ]; then
    if [ ! -e "$file" ]; then
        printf 'message-info "yt-dlp: %s [...]"\n' "$file" > "$QUTE_FIFO"
        yt-dlp -o "$file" "$QUTE_URL"
        if [ ! -e "$file" ]; then
            printf 'message-error "yt-dlp: %s [error]"\n' "$QUTE_URL" > "$QUTE_FIFO"
            exit 0
        fi
    fi
    if [ "$flag_play" != 'true' ]; then
        printf 'message-info ":yt-dlp %s [%s]"\n' "$file" "$(du -hs "$file" | cut -f1)" > "$QUTE_FIFO"
    fi
fi

if [ "$flag_play" = 'true' ]; then
    if [ -e "$file" ]; then
        printf 'message-info ":mpv %s [%s]"\n' "$file" "$(du -hs "$file" | cut -f1)" > "$QUTE_FIFO"
        mpv "$file"
    else
        printf 'message-info ":mpv %s"\n' "$QUTE_URL" > "$QUTE_FIFO"
        mpv "$QUTE_URL"
    fi
fi
