vim9script
## ~/.vimrc ::

set nocompatible
filetype plugin on

# TODO: fzf integration
# TODO: ranger?, vifm?
# TODO: tweak indent navigation funcion
# TODO: tweak vismode
# TODO: comment navigation function
# TODO: move line(s) function?
# TODO: comment toggle comment char?
# TODO: bool toggle function
# TODO: fix <c-Space> mapping inside tmux?
# TODO: path substitution $HOME > ~ in statusbar
# TODO: add comments to everything
# TODO: tweak xclip/paste, maybe make function...

# file:
set autoread
set encoding=utf8
set fileformats=unix,dos,mac
set history=500
set modeline
set modelines=1
set nobackup
set noswapfile
set nowritebackup

# control:
set backspace=eol,indent,start
set formatoptions=tcq
set hidden
set mouse=a
set nojoinspaces
set nopaste
set notimeout
set nrformats=bin,hex
set scrolloff=8
set splitbelow
set splitright
set tags=tags;/
set textwidth=0
set timeoutlen=400
set ttimeout

# tab:
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

# bell:
set noerrorbells
set novisualbell
set t_vb=

# color:
set background=dark
syntax enable
colorscheme utheme

# ui:
set cmdheight=1
set cursorline
set foldcolumn=0
set hlsearch
set laststatus=2
set nofoldenable
set number
set shortmess=aIoOtT
set showcmd
set showtabline=1
set statusline=%!StatusLine()
set tabline=%!TabLine()
set whichwrap+=h,l,s,<,>,[,]
set wrap

# netrw:
g:netrw_banner = 0
g:netrw_fastbrowse = 0
g:netrw_keepdir = 0
g:netrw_list_hide = '^\.\/$'
g:netrw_silent = 1
g:netrw_sort_sequence = '\/$'

# quickfix:
set switchbuf=uselast

# search:
set ignorecase
set incsearch
set magic
set smartcase
set wrapscan

# spell:
set nospell
set spellcapcheck=
set spelllang=en_us
set spelloptions=camel

# terminal:
set autoshelldir

# wildmenu:
set wildignore=*.o,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu
set wildoptions=pum

## autocommands ::
augroup vimrc
    autocmd!
    autocmd FileChangedRO * setlocal noreadonly | MsgWarn('W: readonly buffer')
    autocmd BufEnter * silent! lcd %:p:h
    autocmd BufWritePre * TextTrim()
    autocmd TerminalWinOpen * setlocal nonumber
augroup END

## mappings ::
g:mapleader = ";"
set cedit=<c-q>
set wildcharm=<c-n>
nnoremap <silent> <c-w>m <c-w>x
nnoremap <silent> <leader>V <scriptcmd>call VisMode('V')<cr>
nnoremap <silent> <leader>v <scriptcmd>call VisMode('v')<cr>
nnoremap <silent> <leader>w <scriptcmd>call WinMode()<cr>
noremap <silent> <M-x> <c-x>
noremap <silent> <leader>Q Q
noremap Q <Nop>
noremap \ ;
noremap R gR
noremap gR R

# buffer: new:
nnoremap <silent> <c-w><c-e> <cmd>Explore<cr>
nnoremap <silent> <c-w>N <cmd>enew<cr>
nnoremap <silent> <c-w>\ <cmd>terminal ++curwin ++noclose<cr>
nnoremap <silent> <c-w>e <cmd>Explore<cr>

# buffer: save:
cnoremap <silent> <c-s> <c-c>:write<cr>
inoremap <silent> <c-s> <esc><cmd>write<cr>
nnoremap <silent> <c-s> <cmd>write<cr>
vnoremap <silent> <c-s> <esc><cmd>write<cr>

# buffer: next/previous:
nnoremap <silent> <c-n> <cmd>silent bnext<cr>
nnoremap <silent> <c-p> <cmd>silent bprevious<cr>
nnoremap <silent> <c-w><c-n> <cmd>silent bnext<cr>
nnoremap <silent> <c-w><c-p> <cmd>silent bprevious<cr>
nnoremap <silent> <c-w>n <cmd>silent bnext<cr>
nnoremap <silent> <c-w>p <cmd>silent bprevious<cr>
tnoremap <silent> <c-w><c-n> <cmd>silent bnext<cr>
tnoremap <silent> <c-w><c-p> <cmd>silent bprevious<cr>
tnoremap <silent> <c-w>n <cmd>silent bnext<cr>
tnoremap <silent> <c-w>p <cmd>silent bprevious<cr>

# buffer: list
nnoremap <c-w>B <scriptcmd>call BufList('!')<cr>:buf<Space>
nnoremap <c-w>b <scriptcmd>call BufList()<cr>:buf<Space>

# buffer: wipe:
nnoremap <silent> <c-w><c-x> <scriptcmd>call BufWipe()<cr>
nnoremap <silent> <c-w>X <scriptcmd>call BufWipe('!')<cr>
nnoremap <silent> <c-w>x <scriptcmd>call BufWipe()<cr>
nnoremap <silent> <c-x> <scriptcmd>call BufWipe()<cr>
tnoremap <silent> <c-w><c-x> <scriptcmd>call BufWipe()<cr>
tnoremap <silent> <c-w>X <scriptcmd>call BufWipe('!')<cr>
tnoremap <silent> <c-w>x <scriptcmd>call BufWipe()<cr>
tnoremap <silent> <c-x> <scriptcmd>call BufWipe()<cr>

# window: new:
nnoremap <silent> <c-w>` <cmd>3split<cr><cmd>terminal ++curwin ++noclose<cr>

# window: close:
nnoremap <silent> <c-q> <cmd>quit<cr>
nnoremap <silent> <c-w><c-q> <cmd>quit<cr>
nnoremap <silent> <c-w>Q <cmd>quit!<cr>
nnoremap <silent> <c-w>q <cmd>quit<cr>
tnoremap <silent> <c-w><c-q> <cmd>quit<cr>
tnoremap <silent> <c-w>Q <cmd>quit!<cr>
tnoremap <silent> <c-w>q <cmd>quit<cr>

# tab: move:
nnoremap <silent> <c-w>GT <scriptcmd>call TabMove('left')<cr>
nnoremap <silent> <c-w>Gt <scriptcmd>call TabMove('right')<cr>

# tab: new:
nnoremap <silent> <c-w><c-t> <cmd>execute 'tabnew' .. (@% == "" ? "" : " %")<cr>
nnoremap <silent> <c-w>t <cmd>execute 'tabnew' .. (@% == "" ? "" : " %")<cr>

# text: format:
nnoremap <silent> <leader>0 <scriptcmd>call TextTrim()<cr>
nnoremap <silent> <leader>1 Vip:keeppatterns s/ \+/\r/g<cr>
nnoremap <silent> <leader>D <scriptcmd>call Date('!')<cr>
nnoremap <silent> <leader>J VipJ
nnoremap <silent> <leader>d <scriptcmd>call Date('')<cr>
nnoremap <silent> <leader>f gqip
nnoremap <silent> <leader>S Vip:sort<cr>
nnoremap <silent> <leader>s Vip:sort /^[^A-Za-z0-9]*/<cr>
noremap <silent> <leader>U <scriptcmd>call CommentToggle('!')<cr>
noremap <silent> <leader>h <scriptcmd>call HTMLToggle()<cr>
noremap <silent> <leader>u <scriptcmd>call CommentToggle('')<cr>
vnoremap <silent> <leader>1 <esc><cmd>keeppatterns s/ \+/\r/g<cr>
vnoremap <silent> <leader>f gq
vnoremap <silent> <leader>S <esc><cmd>sort<cr>
vnoremap <silent> <leader>s <esc><cmd>sort /^[^a-za-z0-9]*/<cr>
vnoremap <silent> <leader>s <esc><cmd>'<,'>sort /^[^a-za-z0-9]*/<cr>

# text: move lines:
nnoremap <silent> <m-j> mz<cmd>m+<cr>`z
nnoremap <silent> <m-k> mz<cmd>m-2<cr>`z
vnoremap <silent> <m-j> <esc><cmd>m'>+<bar>`<my`>mzgv`yo`z<cr>
vnoremap <silent> <m-k> <esc><cmd>m'<-2<bar>`>my`<mzgv`yo`z<cr>

# text: put/yank:
noremap <silent> Y yg_
if exists('$DISPLAY') && executable('xclip')
    nnoremap <silent> <leader>y <cmd>yank<bar>call system('xclip -sel clipboard',@0)<cr>
    vnoremap <silent> <leader>y y<cr><cmd>call system('xclip -sel clipboard',@0)<cr>
    noremap <silent> <leader>p <cmd>let @x = system('xclip -sel clipboard -o')<cr>"xp
endif

# navigation: indent:
noremap <silent> [+ <scriptcmd>call indentnav(['prev', 'more'])<cr>
noremap <silent> [- <scriptcmd>call indentnav(['prev', 'less'])<cr>
noremap <silent> [= <scriptcmd>call indentnav(['prev', 'same'])<cr>
noremap <silent> ]+ <scriptcmd>call indentnav(['next', 'more'])<cr>
noremap <silent> ]- <scriptcmd>call indentnav(['next', 'less'])<cr>
noremap <silent> ]= <scriptcmd>call indentnav(['next', 'same'])<cr>

# navigation: line:
noremap <silent> <c-j> gj
noremap <silent> <c-k> gk

# vim: toggle:
nnoremap <silent> <leader><space> <cmd>execute v:hlsearch ? ':noh<bar>echo ":noh"' : ':set hls<bar>echo "  hlsearch"'<cr>
nnoremap <silent> <leader>t/ <cmd>let @/=''<bar>echo '"/ = ""'<cr>
nnoremap <silent> <leader>tm <cmd>setlocal modifiable!<bar>setlocal modifiable?<cr>
nnoremap <silent> <leader>tr <cmd>setlocal readonly!<bar>setlocal readonly?<cr>
nnoremap <silent> <leader>tb <cmd>setlocal buflisted!<bar>setlocal buflisted?<cr>
nnoremap <silent> <leader>tc <cmd>setlocal cursorcolumn!<bar>setlocal cursorcolumn?<cr>
nnoremap <silent> <leader>tl <cmd>setlocal cursorline!<bar>setlocal cursorline?<cr>
nnoremap <silent> <leader>tm <cmd>setlocal modified!<bar>setlocal modified?<cr>
nnoremap <silent> <leader>tn <cmd>setlocal number!<bar>setlocal number?<cr>
nnoremap <silent> <leader>tp <cmd>setlocal paste!<bar>setlocal paste?<cr>
nnoremap <silent> <leader>tr <cmd>setlocal relativenumber!<bar>setlocal relativenumber?<cr>
nnoremap <silent> <leader>ts <cmd>setlocal spell!<bar>setlocal spell?<cr>
nnoremap <silent> <leader>tt <cmd>execute 'set showtabline=' .. (&showtabline + 1) % 3<bar>set showtabline?<cr>
nnoremap <silent> <leader>tw <cmd>setlocal wrap!<bar>setlocal wrap?<cr>
nnoremap <silent> <leader>tz <cmd>if &scrolloff == 999<bar>setlocal scrolloff<<bar>else<bar>setlocal scrolloff=999<bar>endif<bar>setlocal scrolloff?<cr>

# vim: query:
nnoremap <silent> <leader>rm <cmd>setlocal modifiable?<cr>
nnoremap <silent> <leader>rr <cmd>setlocal readonly?<cr>
nnoremap <silent> <leader>rb <cmd>setlocal buflisted?<cr>
nnoremap <silent> <leader>rf <cmd>echo &filetype<cr>
nnoremap <silent> <leader>rh <scriptcmd>call HiGroup()<cr>
nnoremap <silent> <leader>rp <cmd>setlocal paste?<cr>
nnoremap <silent> <leader>rs <cmd>setlocal spell?<cr>

# vim: reload:
noremap <silent> <leader><c-l> <cmd>source ~/.vimrc<bar>nohlsearch<cr><cmd>echo 'source ~/.vimrc'<cr>

## mappings: command ::
cnoremap <c-a> <home>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
cnoremap <c-h> <bs>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <c-e>
cnoremap <m-b> <s-left>
cnoremap <m-f> <s-right>
cnoremap <m-k> <c-k>
cnoremap <m-v> <c-q>
cnoremap <expr> <c-c> pumvisible() ? '<c-e>' : '<c-c>'
cnoremap <expr> <c-e> pumvisible() ? '<c-e>' : '<end>'
cnoremap <expr> <c-u> pumvisible() ? '<c-e>' : '<c-u>'

## mappings: insert ::
inoremap <c-a> <home>
inoremap <c-b> <left>
inoremap <c-d> <del>
inoremap <c-f> <right>
inoremap <c-g> <c-d>
inoremap <c-h> <bs>
inoremap <c-l> <c-e>
inoremap <m-b> <s-left>
inoremap <m-f> <s-right>
inoremap <expr> <c-c> pumvisible() ? '<c-e>' : '<c-c>'
inoremap <expr> <c-e> pumvisible() ? '<c-e>' : '<end>'
inoremap <expr> <c-u> pumvisible() ? '<c-e>' : '<c-u>'

## mappings: terminal ::
tnoremap <c-w><c-w> <c-w>w
tnoremap <silent> <c-w>` <scriptcmd>call BufWipe()<bar>quit<cr>

## commands ::
command! -bang Buflist BufList(<q-bang>)
command! -bang BufWipe BufWipe(<q-bang>)
command! -bang BufWipeHidden BufWipeHidden(<q-bang>)
command! -nargs=? CntSet CntSet(<args>)
command! -nargs=? Sh execute 'silent ! ' .. <q-args> <bar> redraw!

## functions ::
def BufList(bang = '')
    const bufs = bang == '!' ? filter(range(1, bufnr('$')), 'bufexists(v:val)') :
      filter(range(1, bufnr('$')), 'buflisted(v:val)')
    var bufname = ''
    var bufnamelen = 0
    var bufpath = ''
    var bufslist = []
    var buftag = ''
    var buftype = ''
    for buf in bufs
        bufname = bufname(buf)
        bufpath = expand('#' .. buf .. ':p')
        buftag = ''
        buftype = getbufvar(buf, '&buftype')
        if getbufvar(buf, '&filetype') == 'netrw' || bufpath =~ '.*/$'
            bufname = '[netrw]'
        elseif buftype == 'help' || bufpath =~ '.*/vim82/doc/.*txt$'
            bufname = '[h:' .. fnamemodify(bufname, ':t:r') .. ']'
        elseif buftype == 'quickfix'
            bufname = '[quickfix]'
        elseif buftype == 'nofile'
            bufname = bufname =~ '\/.' ? substitute(bufname, '.*\/\ze.', '', '') : bufname
        elseif buftype == 'terminal'
            bufname = '[terminal]'
            bufpath = term_gettitle(buf)
        else
            if bufname == ''
                bufname = '[no name]'
            else
                bufname = fnamemodify(bufname, ':p:t')
            endif
            buftag = getbufvar(buf, '&modified') ? '+' : ''
        endif
        bufnamelen = max([len(bufname), bufnamelen])
        add(bufslist, [buf, bufname, bufpath, buftag])
    endfor
    for buf in bufslist
        echohl Constant
        echo printf('%3d ', buf[0])
        if buf[0] == bufnr('%')
            echohl String
        elseif index(tabpagebuflist(), buf[0]) >= 0
            echohl Special
        elseif !buflisted(buf[0])
            echohl Comment
        else
            echohl Normal
        endif
        echon printf('%1s%-*s', buf[3], bufnamelen, buf[1]) .. '  '
        if buf[0] == bufnr('%') || index(tabpagebuflist(), buf[0]) >= 0
            echohl Type
        elseif !buflisted(buf[0])
            echohl Comment
        else
            echohl Normal
        endif
        echon buf[2]
    endfor
    echohl NONE
enddef

def BufWipe(bang = '')
    const buf = bufnr('%')
    const wincur = winnr()
    var cmd = 'bwipeout'
    if &buftype == 'terminal'
        cmd ..= '!'
    elseif empty(bang) && &modified
        MsgError('E: unsaved buffer modified')
        return
    else
        cmd ..= bang
    endif
    for tab in range(1, tabpagenr('$'))
        tabnext
        for win in filter(range(1, winnr('$')), 'winbufnr(v:val) == ' .. buf)
            execute ':' .. win .. 'wincmd w'
            if len(filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != ' .. buf)) > 0
                silent bprevious
            else
                enew
            endif
        endfor
    endfor
    execute ':' .. wincur .. 'wincmd w'
    if bufexists(buf)
        execute cmd .. ' ' .. buf
    endif
enddef

def BufWipeHidden(bang = '')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && bufwinnr(v:val) == -1')
        if getbufvar(buf, '&buftype') == 'terminal'
            execute 'bwipeout! ' .. buf
        elseif empty(bang) && getbufvar(buf, '&modified')
            MsgError('E: unsaved buffer modified: ' .. buf)
        else
            execute 'bwipeout' .. bang .. ' ' .. buf
        endif
    endfor
enddef

def CommentToggle(bang = '')
    if ! &modifiable
        return
    endif
    var line0 = line('.')
    var line1 = line0
    if index(['V', 'v'], mode()) >= 0
        if line('v') < line('.')
            line0 = line('v')
        elseif line('v') > line('.')
            line1 = line('v')
        endif
        execute "normal! \<esc>"
    endif
    const cmts = split(&commentstring, '%s')
    var cmt0 = '#'
    var cmt1 = ''
    if len(cmts) > 0
        cmt0 = cmts[0]
    endif
    if len(cmts) > 1
        cmt1 = cmts[1]
    endif
    const regex_comment = '\(^\s*\)' .. cmt0 .. '\(.\{-}\)' .. cmt1 .. '\s*$'
    const regex_heading = '^\s*\(' .. cmt0 .. '\)\+\s.\{-}' .. cmt1 .. '\s*$'
    const regex_line = '^\(\s*\)\(.\{-}\)\s*$'
    const sub_comment = '\1' .. cmt0 .. '\2' .. cmt1
    const sub_line = '\1\2\3'
    var text0 = ''
    var text1 = ''
    for line in range(line0, line1)
        text0 = getline(line)
        text1 = text0
        if match(text0, '^\s*$') >= 0 || match(text0, regex_heading) >= 0 || (bang == '!' && cmt1 == '\*/')
            continue
        endif
        if bang == '!' || match(text0, regex_comment) < 0
            text1 = substitute(text0, regex_line, sub_comment, '')
        else
            text1 = substitute(text0, regex_comment, sub_line, '')
        endif
        if text0 != text1
            setline(line, text1)
        endif
    endfor
enddef

var C = 1
def g:Cnt(pad = 2): string
	C = C + 1
	return printf('%0' .. pad .. 'd', C - 1)
enddef

def CntSet(start = 1)
    C = start
enddef

def Date(bang = '')
    if ! &modifiable
        return
    endif
    const c = getpos('.')[2]
    const text0 = getline('.')
    var date = strftime('%F')
    var regex_date = '\d\d\d\d-\d\d-\d\d'
    var text1 = ''
    if bang == '!'
        date = strftime('%F_%H:%M')
        regex_date = '\d\d\d\d-\d\d-\d\d_\d\d:\d\d'
    endif
    if match(text0, regex_date) >= 0
        text1 = substitute(text0, '\(.\{-}\)' .. regex_date .. '\(.*\)', '\1' .. date .. '\2', '')
    else
        text1 = text0[0 : c - 1] .. date .. text0[c : -1]
    endif
    if text0 != text1
        setline('.', text1)
    endif
enddef

def HiGroup()
    echo 'hi=' .. synIDattr(synID(line('.'), col('.'), 1), 'name') .. '  trans=' .. synIDattr(synID(line('.'), col('.'), 0), 'name') .. '  lo=' .. synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
enddef

def HTMLToggle()
    if ! &modifiable
        return
    endif
    var line0 = line('.')
    var line1 = line0
    if index(['V', 'v'], mode()) >= 0
        if line('v') < line('.')
            line0 = line('v')
        elseif line('v') > line('.')
            line1 = line('v')
        endif
        execute "normal! \<esc>"
    endif
    var text0 = ''
    var text1 = ''
    for line in range(line0, line1)
        text0 = getline(line)
        text1 = text0
        if match(text0, '&\(amp\|apos\|gt\|lt\|quot\);') >= 0
            text1 = substitute(substitute(substitute(substitute(substitute(text0, '&amp;', '\&', 'g'), '&apos;', "'", 'g'), '&gt;', '>', 'g'), '&lt;', '<', 'g'), '&quot;', '"', 'g')
        else
            text1 = substitute(substitute(substitute(substitute(substitute(text0, "&", '\&amp;', 'g'), "'", '\&apos;', 'g'), '>', '\&gt;', 'g'), '<', '\&lt;', 'g'), '"', '\&quot;', 'g')
        endif
        if text0 != text1
            setline(line, text1)
        endif
    endfor
enddef

# TODO: next, prev, last, first; same, more, less, diff; skip blank lines
def IndentNav(move = ['next', 'same'])
    const line = getpos('.')[1]
    var linenew = line
    var indent = indent(line)
    var inc = 1
    if move[1] == 'more'
        indent = indent + &tabstop
    elseif move[1] == 'less'
        indent = indent - &tabstop
    endif
    if move[0] == 'prev'
        inc = -1
    endif
    while linenew <= line('$') && linenew >= 1
        linenew = linenew + inc
        if indent(linenew) == indent
            break
        endif
    endwhile
    if line != linenew && linenew <= line('$') && linenew >= 1
        setpos(".", [0, linenew, indent + 1, 0])
    endif
enddef

def MsgError(msg = '')
    echohl ErrorMsg
    echomsg msg
    echohl NONE
enddef

def MsgInfo(msg = '')
    echohl InfoMsg
    echomsg msg
    echohl NONE
enddef

def MsgMode(msg = '')
    echohl ModeMsg
    echomsg msg
    echohl NONE
enddef

def MsgWarn(msg = '')
    echohl WarningMsg
    echomsg msg
    echohl NONE
enddef

def TextTrim()
    if ! &modifiable
        return
    endif
    const pos = getpos('.')
    keeppatterns :%s/\s\+$//e
    keeppatterns :%s/\($\n\s*\)\+\%$//e
    setpos('.', pos)
enddef

def g:StatusLine(): string
    const sepbar = '%#StatusLineSep# | %*'
    const sepcolon = '%#StatusLineSep#:%*'
    const buf = winbufnr(g:statusline_winid)
    const filetype = getbufvar(buf, '&filetype')
    const buftype = getbufvar(buf, '&buftype')
    const wincur = winnr()
    var bufname = '%{expand("%:p:t")}'
    var bufpath = expand('#' .. buf .. ':p:h')
    var buftag = '%{&modified ? "+" : " "}'
    var line = ''
    if filetype == 'netrw' || bufpath =~ '.*/$'
        bufname = '[netrw]'
        buftag = ' '
    elseif buftype == 'terminal'
        bufname = '[terminal]'
        bufpath = term_gettitle(buf)
        buftag = ' '
    elseif buftype == 'help'
        bufname = '[h:%{expand("%:t:r")}]'
        buftag = ' '
    elseif buftype == 'quickfix'
        bufname = '[quickfix]'
    elseif bufname(buf) == ''
        bufname = '[no name]'
        bufpath = getcwd(g:statusline_winid)
    endif
    if bufpath != '/' && buftype != 'terminal'
        bufpath ..= '/'
    endif
    line =  buftag .. bufname .. sepbar .. '%*%<'
    if g:statusline_winid == win_getid(wincur)
        line ..= '%#StatusLinePath#' .. bufpath .. '%=%( %#StatusLineType#' .. filetype .. sepbar .. '%*%#StatusLinePct#%P' .. sepbar .. '%#StatusLineLen#%2L' .. sepcolon .. '%2l' .. sepbar .. '%#StatusLineLen#'
    else
        line ..= bufpath .. '%=%( ' .. filetype .. sepbar .. '%P' .. sepbar .. '%2L' .. sepcolon .. '%2l' .. sepbar
    endif
    line ..= '%2{strlen(getline("."))}' .. sepcolon .. '%2c %)'
    return line
enddef

def g:TabLine(): string
    var buflist = []
    var bufname = ''
    var buf = 0
    var bufpath = ''
    var buftag = ' '
    var buftype = ''
    var filetype = ''
    var tabnum = 1
    var win = 0
    var line = ''
    while tabnum <= tabpagenr('$')
        win = tabpagewinnr(tabnum)
        buflist = tabpagebuflist(tabnum)
        buf = buflist[win - 1]
        bufname = bufname(buf)
        bufpath = expand('#' .. buf .. ':p')
        buftype = getbufvar(buf, '&buftype')
        filetype = getbufvar(buf, '&filetype')
        buftag = ' '
        if filetype == 'netrw' || bufpath =~ '.*/$'
            buftype = 'netrw'
            bufname = '[netrw]'
        elseif buftype == 'help'
            bufname = '[h:' .. fnamemodify(bufname, ':t:r') .. ']'
        elseif buftype == 'quickfix'
            bufname = '[quickfix]'
        elseif buftype == 'terminal'
            bufname = '[terminal]'
        elseif filetype == 'checkhealth'
            bufname = '[checkhealth]'
        elseif buftype == 'nofile'
            if bufname =~ '\/.'
                bufname = substitute(bufname, '.*\/\ze.', '', '')
            endif
        else
            bufname = fnamemodify(bufname, ':p:t')
            if bufname == ''
                bufname = '[no name]'
            endif
            if getbufvar(buf, '&modified') && buftype != 'terminal'
                buftag = '+'
            endif
        endif
        if len(buflist) > 1 && buftag == ' '
            for b in buflist
                if b != buf && getbufvar(b, '&modified')
                && getbufvar(b, '&buftype') != 'terminal'
                    buftag = '*'
                    break
                endif
            endfor
        endif
        line ..= (tabnum == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#') .. buftag .. bufname .. ' ' .. '%#TabLineSep#|'
        tabnum = tabnum + 1
    endwhile
    line ..= '%T%#TabLineFill#'
    return line
enddef

def TabMove(move = 'left')
    if move == 'left'
        if tabpagenr() == 1
            tabmove
        else
            tabmove -1
        endif
    elseif move == 'right'
        if tabpagenr() == tabpagenr('$')
            tabmove 0
        else
            tabmove +
        endif
    endif
enddef

def VisMode(mode = 'v')
    var charnum = 0
    var line = line('.')
    execute 'normal! ' .. mode
    while 1
        if mode() !=? 'v'
            if mode ==# 'v'
                normal! gv
            else
                normal! `>V`<
                if line('.') != line
                    normal! o
                endif
            endif
        endif
        redraw
        if mode ==# 'v'
            MsgMode('-- VISMODE --')
        else
            MsgMode('-- VISMODE LINE --')
        endif
        charnum = getchar()
        line = line('.')
        execute 'normal ' .. nr2char(charnum)
        if charnum == 27
            return
        endif
    endwhile
enddef

def WinMode()
    var charnum = 0
    var chars = ''
    while 1
        redraw
        MsgMode('-- WINMODE --')
        charnum = getchar()
        if charnum == 27
            redraw
            echon ''
            return
        endif
        if charnum == 103 || charnum == 71
            chars = nr2char(charnum)
            continue
        endif
        chars ..= nr2char(charnum)
        execute 'normal ' .. nr2char(23) .. chars
        chars = ''
    endwhile
enddef

defcompile
