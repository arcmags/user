#!/bin/sh
## ~/.local/share/qutebrowser/userscripts/zathura.sh ::
# doesn't work when on the actual *.pdf page in qutebrowser

cd "$QUTE_DOWNLOAD_DIR"
file_dl="${QUTE_URL##*/}"
file_ext="$(printf '%s' "${file_dl##*.}" | tr '[:upper:]' '[:lower:]')"

if [ "$file_ext" != 'pdf' ]; then
    printf 'message-error "zathura: unsupported extension: %s"\n' "$file_ext" > "$QUTE_FIFO"
    exit 0
fi

if [ -e "$file_dl" ]; then
    printf 'message-info "zathura: %s"\n' "$file_dl" > "$QUTE_FIFO"
    zathura "$file_dl"
else
    printf 'message-info "curl & zathura: %s"\n' "$file_dl" > "$QUTE_FIFO"
    curl -s --output "$file_dl" "$QUTE_URL" && zathura "$file_dl"
fi
