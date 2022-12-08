#!/bin/sh
## ~/.profile ::

## user setup: UDIR, UHOST, upwd() ::
export UDIR="$HOME/user"

if [ -f '/etc/hostname-' ]; then
    UHOST="$(cat /etc/hostname-)"
elif [ -f '/etc/hostname' ]; then
    UHOST="$(cat /etc/hostname)"
else
    UHOST="$(uname -o | tr -dc 'A-Za-z0-9/_-' | tr '[:upper:]' '[:lower:]')"
fi
export UHOST

upwd() {
    case "$PWD" in
        "$UDIR"*)
            printf '%s' "-${PWD#"$UDIR"}" ;;
        "$HOME"*)
            printf '%s' "~${PWD#"$HOME"}" ;;
        *)
            printf '%s' "$PWD"
    esac
}

## utils ::
is_bin() (
    [ -z "$1" ] && return 1
    IFS=':'
    for dir in $PATH; do
        [ -f "$dir/$1" ] && [ -x "$dir/$1" ] && return 0
    done
    return 1
)

path_add() {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            export PATH="$1${PATH:+:$PATH}" ;;
    esac
}

## PATH ::
path_add "$HOME/.local/bin"
path_add "$UDIR/bin"
path_add "$HOME/bin"

## environment ::
command_not_found_handle() {
    printf '\e[1;38;5;11m==> \e[0;38;5;15mnot found: %s\e[0m\n' "$1"
    return 127
}

[ "$TERM" = 'linux' ] && export TERM='linux-16color'

is_bin w3m && export BROWSER='w3m'

export COLORFGBG='7;0'

export PS1='\[\e[0;38;5;6m\]$UHOST\[\e[1;38;5;10m\]:\[\e[38;5;12m\]$(upwd)\[\e[38;5;10m\]\$\[\e[0m\] '
export PS2='\[\e[0m\] '

[ -f "$HOME/.pythonrc" ] && export PYTHONSTARTUP="$HOME/.pythonrc"

[ -d "$UDIR/dat/figlet" ] && export FIGLET_FONTDIR="$UDIR/dat/figlet"

export TMPDIR='/tmp'

export EDITOR='vim'
export VISUAL="$EDITOR"
export FCEDIT="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"

if [ -f "$HOME/.lscolors" ]; then
    eval "$(dircolors "$HOME/.lscolors")"
else
    eval "$(dircolors)"
fi

export GREP_COLORS='mt=38;5;3:mc=48;5;3;38;5;0:fn=38;5;14:ln=38;5;8:bn=38;5;4:se=1;38;5;5'

export FZF_DEFAULT_COMMAND="find -type f -printf '%P\n'"
export FZF_DEFAULT_OPTS="--height 60% --reverse --tac --no-unicode --no-separator --marker='*' \
  --color='bg+:4' --color='bg:-1' --color='border:8:bold' --color='disabled:8' \
  --color='fg+:10:regular' --color='fg:-1' --color='gutter:-1' --color='header:12:bold' \
  --color='hl+:13:regular' --color='hl:13' --color='info:12' --color='label:8:bold' \
  --color='marker:10:bold' --color='pointer:10:bold' --color='preview-bg:-1' \
  --color='preview-fg:-1' --color='prompt:10:bold' --color='query:15:regular' \
  --color='separator:8:bold' --color='spinner:12:bold' --bind 'ctrl-d:half-page-down' \
  --bind 'ctrl-u:half-page-up' --bind 'ctrl-n:page-down' --bind 'ctrl-p:page-up' \
  --bind 'alt-d:half-page-down' --bind 'alt-u:half-page-up' --bind 'alt-n:page-down' \
  --bind 'alt-p:page-up' --bind 'alt-j:down' --bind 'alt-k:up' --bind 'alt-h:backward-char' \
  --bind 'alt-l:forward-char' --bind 'alt-t:first' --bind 'alt-b:last' --bind 'alt-v:toggle-preview' \
  --preview='cat {}' --preview-window hidden"

is_bin gpg && gpg --list-secret-keys '4742C8240A64DA01' >/dev/null 2>&1 && export GPGKEY='4742C8240A64DA01'

export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL='ignoredups:ignorespace'
export HISTIGNORE='ls:ls1:lsl:bg:fg:exit:poweroff:reboot:startx'
export CDHISTSIZE=20

LESS='-i -x4 -M -R --mouse --wheel-lines=4 -PM ?f%f:[stdin]. ?m(%i/%m) .| %L lines | ?eBot:%Pb\%. | %lt-%lb $'
if less --help | grep -q 'use-color'; then
    LESS="$LESS"' --use-color -DsG$ -DdB$ -DuC$ -DkR$ -DER$ -DNK$ -DPGb$ -DSyb$ -DMg$'
else
    export LESS_TERMCAP_mb="$(printf '\e[38;5;12m')"
    export LESS_TERMCAP_md="$(printf '\e[38;5;12m')"
    export LESS_TERMCAP_me="$(printf '\e[0m')"
    export LESS_TERMCAP_se="$(printf '\e[0m')"
    export LESS_TERMCAP_so="$(printf '\e[48;5;4;38;5;10m')"
    export LESS_TERMCAP_ue="$(printf '\e[0m')"
    export LESS_TERMCAP_us="$(printf '\e[38;5;14m')"
fi
LESS="$LESS"' +Gg'
export LESS

export MANPAGER='less -m'
export MANLESS=' man $MAN_PN | %L lines | ?eBot:%pb\%. | %lt-%lb '

export PROMPT_COMMAND='printf "\033]0;%s\007" "${SHELL##*/}"'

export PAGER='less'

export S_COLORS='always'
export S_COLORS_SGR='H=33;1:I=36;1:M=34;1:N=32;1:Z=34;1'

export SUDO_PROMPT="$(printf '\e[1;38;5;9m::> \e[0;38;5;15mpassword: ')"

export QT_QPA_PLATFORMTHEME='qt5ct'

## aliases ::
[ -d "$UDIR/dat" ] && cdd() { cd "$UDIR/dat"; }
[ -d "$UDIR/git" ] && cdg() { cd "$UDIR/git"; }
[ -d "$UDIR/sync/img" ] && cdi() { cd "$UDIR/sync/img"; }
[ -d "$UDIR/local" ] && cdl() { cd "$UDIR/local"; }
[ -d /mnt ] && cdm() { cd /mnt; }
[ -d /mnt/pi ] && cdp() { cd /mnt/pi; }
[ -d "$UDIR/sync" ] && cds() { cd "$UDIR/sync"; }
[ -d "$TMPDIR" ] && cdt() { cd "$TMPDIR"; }
[ -d "$UDIR" ] && cdu() { cd "$UDIR"; }
[ -d /mnt/pi/mnt/hdd/vid ] && cdv() { cd /mnt/pi/mnt/hdd/vid; }
[ "$UHOST" = 'arch-pi' ] && cdv() { cd /mnt/hdd/vid; }
[ -d "$UDIR/sync/www" ] && cdw() { cd "$UDIR/sync/www"; }

is_bin diff && diff() { command diff --color=auto "$@"; }

is_bin ffmpeg && ffmpeg() { command ffmpeg -hide_banner "$@"; }
is_bin ffprobe && ffprobe() { command ffprobe -hide_banner "$@"; }

grep() { command grep --color=auto "$@"; }

is_bin gpg && gpg() { command gpg --no-greeting -q "$@"; }

ip() { command ip -color=auto "$@"; }

ls() { LANG=C command ls -ALh --color=auto --group-directories-first "$@"; }
ls1() { ls -1 "$@"; }
lsl() { ls -l "$@"; }

su() { printf '\e[1;38;5;9m::> \e[0;38;5;15m'; command su "$@"; }

is_bin tmux && tmux() { command tmux -2 "$@"; }

is_bin vim && [ "$TERM" = 'linux' ] && vim() { TERM='linux-16color' command vim "$@"; }

if [ -n "$DISPLAY" ] && is_bin xclip; then
    xclip() {
        command xclip -sel clipboard "$@"
    }
    xyank() {
        xclip
    }
    xput() {
        xclip -o
    }
fi

## commands ::
if [ -d "$TMPDIR" ]; then
    cdtt() {
        d=1
        while [ -e "$(printf '%s/tmp_%02d' "$TMPDIR" $d)" ]; do
            d=$((d+1))
        done
        dir_tmp="$(printf '%s/tmp_%02d' "$TMPDIR" "$d")"
        mkdir "$dir_tmp"
        if [ -n "$1" ]; then
            cp -r "$@" "$dir_tmp"
        fi
        cd "$dir_tmp"
        unset d dir_tmp
    }
fi

if [ -n "$DISPLAY" ] && is_bin feh; then
    feh() (
        w="$(xrandr | grep -Po 'primary +\K[0-9]+x[0-9]+')"
        h="${w#*x}"
        w="${w%x*}"
        command feh --geometry $((w-100))x$((h-100)) --limit-width $((w-100)) "$@"
    )
fi

if is_bin gpgconf; then
    gpgreset() {
        gpgconf --kill gpg-agent
    }
fi

reload() {
    . "$HOME/.profile"
}

if [ -n "$DISPLAY" ] && is_bin import; then
    screenshot() (
        png_screen="/tmp/screen_$(date +'%F_%H-%M-%S').png"
        import -window root "$png_screen" && printf '%s\n' "$png_screen"
    )
elif [ -z "$DISPLAY" ] && is_bin fbgrab && groups | grep -q '\bvideo\b'; then
    screenshot() (
        png_screen="/tmp/screen_$(date +'%F_%H-%M-%S').png"
        fbgrab "$png_screen" >/dev/null 2>&1 && printf '%s\n' "$png_screen"
    )
fi

if is_bin nc; then
    tb() {
        nc termbin.com 9999
    }
fi

titleset() {
    [ -n "$1" ] && printf '\033]0;%s\007' "$*"
}

termset() {
    if [ "$TERM" = 'linux' ] || [ "$TERM" = 'linux-16color' ]; then
        if [ -f "$HOME/.cache/wal/colors-tty.sh" ]; then
            sh "$HOME/.cache/wal/colors-tty.sh"
        elif [ -f "$UDIR/.user/.cache/wal/colors-tty.sh" ]; then
            sh "$UDIR/.user/.cache/wal/colors-tty.sh"
        else
            return 1
        fi
    elif [ -z "$TMUX" ]; then
        if [ -f "$HOME/.cache/wal/sequences" ]; then
            cat "$HOME/.cache/wal/sequences"
        elif [ -f "$UDIR/.user/.cache/wal/sequences" ]; then
            cat "$UDIR/.user/.cache/wal/sequences"
        else
            return 1
        fi
    else
        return 1
    fi
}
