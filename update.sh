#!/bin/bash

## update.sh ::
# Copy source files to target directory preserving relative paths.

dir_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir_src="$HOME/user"
files_src=(
    bin/img-web
    bin/ucolors
    bin/usync
    bin/uvpn
    bin/uirc
    bin/uln
    bin/dl-watch
    dat/figlet/
    dat/gdnsd/gdnsd
    dat/gdnsd/gdnsd.service
    dat/mc-server/datapacks/
    dat/qmk/layouts/
    dat/qmk/layouts.txt
    dat/ref/git.txt
    dat/ref/gui.txt
    dat/ref/nspawn.txt
    dat/ref/qemu.txt
    dat/ref/qmk.txt
    dat/ref/vim.txt
    dat/ref/readline.txt
    dat/ramroot/
    dat/text/Meditations.txt
    .root/etc/X11/
    .root/etc/fonts/local.conf
    .root/etc/vconsole.conf
    .root/etc/vconsole.map
    .user/.config/feh/
    .user/.config/fontconfig/fonts.conf
    .user/.config/i3/
    .user/.config/i3status/
    .user/.config/imv/
    .user/.config/mpv/input.conf
    .user/.config/mpv/mpv.conf
    .user/.config/nordvpn/
    .user/.config/picom.conf
    .user/.config/pycodestyle
    .user/.config/qutebrowser/config.py
    .user/.config/qutebrowser/css/
    .user/.config/qutebrowser/greasemonkey/
    .user/.config/ranger/
    .user/.config/ttyper/
    .user/.config/wal/
    .user/.config/yt-dlp/
    .user/.config/zathura/
    .user/.ipython/profile_default/ipython_config.py
    .user/.ipython/profile_default/startup/ipythonrc.py
    .user/.irssi/config
    .user/.irssi/scripts/
    .user/.irssi/utheme.theme
    .user/.local/share/applications/vim.desktop
    .user/.local/share/fonts/
    .user/.local/share/qutebrowser/userscripts/
    .user/.moc/config
    .user/.moc/keymap.conf
    .user/.moc/themes/
    .user/.mozilla/firefox/default/chrome/
    .user/.themes/
    .user/.vim/colors/utheme.vim
    .user/.w3m/config
    .user/.w3m/keymap
    .user/.Xmodmap
    .user/.Xresources
    .user/.Xtheme
    .user/.bash_profile
    .user/.bashrc
    .user/.gdbinit
    .user/.infokey
    .user/.inputrc
    .user/.lesskey
    .user/.lscolors
    .user/.nanorc
    .user/.pinforc
    .user/.profile
    .user/.pythonrc
    .user/.shellcheckrc
    .user/.sqliterc
    .user/.tmux.conf
    .user/.vimrc
    .user/.xinitrc
    .user/.xprofile
    .user/.uln
)

cd "$dir_src"

files=()
for file in "${files_src[@]}"; do
    [ -e "$file" ] && files+=("$file")
done
cp -r --parents "${files[@]}" "$dir_script"

if [ "$1" = '--git' ] || [ "$1" = '-G' ]; then
    cd "$dir_script"
    git add --all
    git commit -m "update.sh $(date +'%F %R')" -S
    git push
fi

# vim: set ft=bash
