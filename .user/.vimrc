vim9script
## ~/.vimrc ::

set nocompatible
filetype plugin on

# TODO: integrate fzf, ranger?, vifm?
# TODO: tweak indent navigation funcion
# TODO: tweak vismode
# TODO: bool toggle function
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

# colors:
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
set scrolloff=8
set shortmess=aIoOtT
set showcmd
set showtabline=1
set signcolumn=number
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
    #autocmd FileChangedRO * setl noreadonly | Msg('W: readonly buffer')
    autocmd BufEnter * silent! lcd %:p:h
    autocmd BufWritePre * TextTrim()
    autocmd TerminalWinOpen * setl nonumber
augroup END

## mappings ::
g:mapleader = ";"
set cedit=<c-q>
set wildcharm=<c-n>
nnoremap Q <Nop>

# remaps:
nnoremap <c-w>m <c-w>x
nnoremap <m-q> Q
nnoremap <m-x> <c-x>
noremap \ ;

# modes:
nnoremap <leader>V <scriptcmd>VisMode('V')<cr>
nnoremap <leader>v <scriptcmd>VisMode('v')<cr>
nnoremap <leader>w <scriptcmd>WinMode()<cr>
nnoremap R gR
nnoremap gR R

# buffer: new:
nnoremap <c-w><c-e> <cmd>Explore<cr>
nnoremap <c-w>N <cmd>enew<cr>
nnoremap <c-w>\ <cmd>terminal ++curwin ++noclose<cr>
nnoremap <c-w>e <cmd>Explore<cr>

# buffer: save:
noremap <c-s> <esc><cmd>write<cr>
noremap! <c-s> <esc><cmd>write<cr>

# buffer: next/previous:
nnoremap <c-n> <cmd>silent bnext<cr>
nnoremap <c-p> <cmd>silent bprevious<cr>
nnoremap <c-w><c-n> <cmd>silent bnext<cr>
nnoremap <c-w><c-p> <cmd>silent bprevious<cr>
nnoremap <c-w>n <cmd>silent bnext<cr>
nnoremap <c-w>p <cmd>silent bprevious<cr>

# buffer: list:
nnoremap <c-w>B <scriptcmd>BufList('!')<cr>:b<Space>
nnoremap <c-w>b <scriptcmd>BufList()<cr>:b<Space>

# buffer: wipe:
nnoremap <c-w><c-x> <scriptcmd>BufWipe()<cr>
nnoremap <c-w>X <scriptcmd>BufWipe('!')<cr>
nnoremap <c-w>x <scriptcmd>BufWipe()<cr>
nnoremap <c-x> <scriptcmd>BufWipe()<cr>

# window: navigate:
nnoremap <c-w><space> <c-w><c-p>
nnoremap <c-w><c-space> <c-w><c-p>

# window: new:
nnoremap <c-w>` <cmd>3split<cr><cmd>ter ++curwin ++noclose<cr>

# window: close/quit: TODO:
nnoremap <expr> <c-q> winnr('$') > 1 ? '<cmd>clo<cr>' : '<cmd>q<cr>'
nnoremap <expr> <c-w><c-q> winnr('$') > 1 ? '<cmd>clo<cr>' : '<cmd>q<cr>'
nnoremap <expr> <c-w>q winnr('$') > 1 ? '<cmd>clo<cr>' : '<cmd>q<cr>'
nnoremap <expr> <c-w>Q '<cmd>' .. (winnr('$') > 1 ? 'clo!' : tabpagenr('$') > 1 ? 'q!' : 'qa!') .. '<cr>'

# tab: move:
nnoremap <expr> <c-w>GT tabpagenr() == 1 ? '<cmd>tabm<cr>' : '<cmd>-tabm<cr>'
nnoremap <expr> <c-w>Gt tabpagenr() == tabpagenr('$') ? '<cmd>0tabm<cr>' : '<cmd>+tabm<cr>'

# tab: new:
nnoremap <c-w><c-t> <cmd>tab split<cr>
nnoremap <c-w>t <cmd>tab split<cr>

# cursor: toggle between start and end of last selection:
nnoremap <expr> <leader>o getpos('.') == getpos("'<") ? "`>" : "`<"

# cursor: down/up display line:
noremap <silent> <c-j> gj
noremap <silent> <c-k> gk

# text: format (wrap) lines to textwidth if set, 79 characters if not:
nnoremap <leader>f gqip
vnoremap <leader>f gq

# text: trim all trailing spaces and lines:
nnoremap <leader>0 <scriptcmd>TextTrim()<cr>

# text: replace spaces with newlines:
nnoremap <leader>1 vip<esc><cmd>'<,'>keeppatterns s/ \+/\r/ge<cr>
vnoremap <leader>1 <esc><cmd>'<,'>keeppatterns s/ \+/\r/ge<cr>

# text: insert/update date string:
nnoremap <leader>D <scriptcmd>DateAdd('!')<cr>
nnoremap <leader>d <scriptcmd>DateAdd()<cr>

# text: join lines:
nnoremap <leader>J vipJ

# text: sort lines:
nnoremap <leader>S mzvip<esc><cmd>'<,'>sort<cr>`z
vnoremap <leader>S <esc><cmd>'<,'>sort<cr>

# text: sort lines by first alphanumeric character in each line:
nnoremap <leader>s mzvip<esc><cmd>'<,'>sort /^[^A-Za-z0-9]*/<cr>`z
vnoremap <leader>s <esc><cmd>'<,'>sort /^[^a-za-z0-9]*/<cr>

# text: toggle html escape characters (&amp; &lt; &gt;):
noremap <leader>H <scriptcmd>HTMLToggle('!')<cr>
noremap <leader>h <scriptcmd>HTMLToggle()<cr>

# text: toggle comment:
noremap <leader>U <scriptcmd>CommentToggle('!')<cr>
noremap <leader>u <scriptcmd>CommentToggle()<cr>

# text: insert blank lines:
nnoremap - mzO<esc>0D`z
nnoremap + mzo<esc>0D`z

# text: move lines:
nnoremap <m-j> mz<cmd>m+<cr>`z
nnoremap <m-k> mz<cmd>m-2<cr>`z
vnoremap <m-j> <esc><cmd>'<,'>m'>+<cr>gv
vnoremap <m-k> <esc><cmd>'<,'>m'<-2<cr>gv

# text: delete:
nnoremap dD 0d$

# text: put/yank: TODO: xterm escape sequences:
nnoremap Y yg_
nnoremap yY mz0yg_`z
if exists('$DISPLAY') && executable('xclip')
    nnoremap <leader>Y vg_y<cmd>call system('xclip -sel clipboard', @0)<cr>
    nnoremap <leader>p <cmd>let @x = system('xclip -sel clipboard -o')<cr>"xp
    nnoremap <leader>y mz^vg_y<cmd>call system('xclip -sel clipboard', @0)<cr>`z
    vnoremap <leader>y y<cmd>call system('xclip -sel clipboard', @0)<cr>
endif

# navigation: indent: TODO:
#noremap <silent> [+ <scriptcmd>IndentNav(['prev', 'more'])<cr>
#noremap <silent> [- <scriptcmd>IndentNav(['prev', 'less'])<cr>
#noremap <silent> [= <scriptcmd>IndentNav(['prev', 'same'])<cr>
#noremap <silent> ]+ <scriptcmd>IndentNav(['next', 'more'])<cr>
#noremap <silent> ]- <scriptcmd>IndentNav(['next', 'less'])<cr>
#noremap <silent> ]= <scriptcmd>IndentNav(['next', 'same'])<cr>

# vim: set/toggle local options:
nnoremap <expr> <leader><space> v:hlsearch ? '<cmd>noh<cr>' : '<cmd>set hls<cr>'
nnoremap <expr> <leader>tS '<cmd>setl scl=' .. (&scl == 'no' ? 'number' : 'no') .. '<cr><cmd>setl scl?<cr>'
nnoremap <expr> <leader>tc '<cmd>setl cc=' .. (empty(&cc) ? '72' : (&cc == '72' ? '80' : '')) .. '<bar>setl cc?<cr>'
nnoremap <expr> <leader>tt '<cmd>set stal=' .. (&stal + 1) % 3 .. '<bar>set stal?<cr>'
nnoremap <expr> <leader>tz '<cmd>setl so' .. (&so == 999 ? '<' : '=999') .. '<bar>setl so?<cr>'
nnoremap <leader>t/ <cmd>let @/=''<bar>echo '"/ = ""'<cr>
nnoremap <leader>tC <cmd>setl cursorcolumn!<bar>setl cuc?<cr>
nnoremap <leader>tL <cmd>setl cursorline!<bar>setl cul?<cr>
nnoremap <leader>tM <cmd>setl modifiable!<bar>setl ma?<cr>
nnoremap <leader>tN <cmd>setl relativenumber!<bar>setl rnu?<cr>
nnoremap <leader>tR <cmd>setl readonly!<bar>setl ro?<cr>
nnoremap <leader>tl <cmd>setl buflisted!<bar>setl bl?<cr>
nnoremap <leader>tm <cmd>setl modified!<bar>setl mod?<cr>
nnoremap <leader>tn <cmd>setl number!<bar>setl nu?<cr>
nnoremap <leader>tp <cmd>setl paste!<bar>setl paste?<cr>
nnoremap <leader>ts <cmd>setl spell!<bar>setl spell?<cr>
nnoremap <leader>tw <cmd>setl wrap!<bar>setl wrap?<cr>

# vim: query local options/attributes:
nnoremap <leader>rM <cmd>setl modifiable?<cr>
nnoremap <leader>rR <cmd>setl readonly?<cr>
nnoremap <leader>rf <cmd>echo &filetype<cr>
nnoremap <leader>rh <scriptcmd>HiGroupPrint()<cr>
nnoremap <leader>rl <cmd>setl buflisted?<cr>
nnoremap <leader>rp <cmd>setl paste?<cr>
nnoremap <leader>rs <cmd>setl spell?<cr>

# vim: reload:
noremap <leader><c-l> <cmd>source ~/.vimrc<bar>noh<cr><cmd>echo ':source ~/.vimrc'<cr>

## mappings: command/insert/search ::
noremap! <c-a> <home>
noremap! <c-b> <left>
noremap! <c-d> <del>
noremap! <c-f> <right>
noremap! <c-h> <bs>
noremap! <m-b> <s-left>
noremap! <m-w> <s-right>

# completion menu: cancel selection, keep already entered text:
noremap! <expr> <c-c> pumvisible() ? '<c-e>' : '<c-c>'
noremap! <expr> <c-e> pumvisible() ? '<c-e>' : '<end>'
noremap! <expr> <c-u> pumvisible() ? '<c-e>' : '<c-u>'

## mappings: command/search ::
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <m-k> <c-k>
cnoremap <m-v> <c-q>

## mappings: insert ::
inoremap <c-g> <c-d>

## mappings: terminal ::
tnoremap <c-w><c-w> <c-w>w

# buffer: next/previous:
tnoremap <c-w>n <cmd>silent bnext<cr>
tnoremap <c-w><c-n> <cmd>silent bnext<cr>
tnoremap <c-w>p <cmd>silent bprevious<cr>
tnoremap <c-w><c-p> <cmd>silent bprevious<cr>

# buffer: wipe:
tnoremap <c-w><c-x> <scriptcmd>BufWipe('!')<cr>
tnoremap <c-w>X <scriptcmd>BufWipe('!')<cr>
tnoremap <c-w>x <scriptcmd>BufWipe('!')<cr>
tnoremap <c-x> <scriptcmd>BufWipe('!')<cr>

# window: close: TODO:
tnoremap <expr> <c-w><c-q> winnr('$') > 1 ? '<cmd>clo<cr>' : '<cmd>q<cr>'
tnoremap <expr> <c-w>q winnr('$') > 1 ? '<cmd>clo<cr>' : '<cmd>q<cr>'
tnoremap <expr> <c-w>Q '<cmd>' .. (winnr('$') > 1 ? 'clo!' : tabpagenr('$') > 1 ? 'q!' : 'qa!') .. '<cr>'

# buffer, window: wipe, close:
tnoremap <expr> <c-w>` '<scriptcmd>BufWipe("!")<bar>' .. (winnr("$") > 1 ? 'clo!<cr>' : 'q!<cr>')

## commands ::
command! -bang Buflist BufList(<q-bang>)
command! -bang BufWipe BufWipe(<q-bang>)
command! -bang BufWipeHidden BufWipeHidden(<q-bang>)
command! -nargs=? CntSet CntSet(<args>)

## functions ::
def BufList(bang = '')
    const bufs = empty(bang) ? filter(range(1, bufnr('$')),
      'buflisted(v:val)') : filter(range(1, bufnr('$')), 'bufexists(v:val)')
    var bufname = ''
    var bufnamelen = 0
    var bufpath = ''
    var bufslist = []
    var buftag = ''
    var buftype = ''
    for buf in bufs
        bufname = bufname(buf)
        bufpath = expand('#' .. buf .. ':p')
        buftag = ' '
        buftype = getbufvar(buf, '&buftype')
        if getbufvar(buf, '&filetype') == 'netrw' || bufpath =~ '.*/$'
            bufname = '[netrw]'
        elseif buftype == 'help' || bufpath =~ '.*/vim82/doc/.*txt$'
            bufname = '[h:' .. fnamemodify(bufname, ':t:r') .. ']'
        elseif buftype == 'quickfix'
            bufname = '[quickfix]'
        elseif buftype == 'nofile'
            bufname = bufname =~ '\/.' ? substitute(bufname,
              '.*\/\ze.', '', '') : bufname
        elseif buftype == 'terminal'
            bufname = '[terminal]'
            bufpath = term_gettitle(buf)
        else
            bufname = empty(bufname) ? '[no name]' : fnamemodify(bufname, ':p:t')
            buftag = getbufvar(buf, '&modified') ? '+' : ' '
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
    if empty(bang) && &modified
        Msg('E: unsaved buffer modified')
        return
    endif
    for tab in range(1, tabpagenr('$'))
        tabnext
        for win in filter(range(1, winnr('$')), 'winbufnr(v:val) == ' .. buf)
            exec ':' .. win .. 'wincmd w'
            if len(filter(range(1, bufnr('$')),
              'buflisted(v:val) && v:val != ' .. buf)) > 0
                silent bprevious
            else
                enew
            endif
        endfor
    endfor
    exec ':' .. wincur .. 'wincmd w'
    if bufexists(buf)
        exec 'bwipeout' .. bang .. ' ' .. buf
    endif
enddef

def BufWipeHidden(bang = '')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && bufwinnr(v:val) == -1')
        if getbufvar(buf, '&buftype') == 'terminal'
            exec 'bwipeout! ' .. buf
        elseif empty(bang) && getbufvar(buf, '&modified')
            Msg('E: unsaved buffer modified: ' .. buf)
        else
            exec 'bwipeout' .. bang .. ' ' .. buf
        endif
    endfor
enddef

def CommentToggle(bang = '')
    if ! &modifiable
        return
    endif
    var line0 = line('.')
    var line1 = line0
    if mode() ==? 'v'
        if line('v') < line0
            line0 = line('v')
        else
            line1 = line('v')
        endif
        exec "normal! \<esc>"
    endif
    const cmts = split(&commentstring, '%s')
    var cmt0 = '#'
    var cmt1 = ''
    if len(cmts) > 0
        cmt0 = substitute(substitute(escape(cmts[0], '*.\'),
          '\s\+', '', 'g'), '^\\\.\\\.', '\\\.\\\. ', '')
    endif
    if len(cmts) > 1
        cmt1 = substitute(escape(cmts[1], '*.\'), '\s\+', '', 'g')
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
        if match(text0, '^\s*$') >= 0 || match(text0, regex_heading) >= 0
          || (bang == '!' && cmt1 == '\*/')
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

def DateAdd(bang = '')
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
        text1 = substitute(text0, '\(.\{-}\)' .. regex_date .. '\(.*\)',
          '\1' .. date .. '\2', '')
    else
        text1 = text0[0 : c - 1] .. date .. text0[c : -1]
    endif
    if text0 != text1
        setline('.', text1)
    endif
enddef

def HiGroupPrint()
    echo [synIDattr(synID(line('.'), col('.'), 1), 'name'),
      synIDattr(synID(line('.'), col('.'), 0), 'name'),
      synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')]
enddef

def HTMLToggle(bang = '')
    if ! &modifiable
        return
    endif
    var line0 = line('.')
    var line1 = line0
    if mode() ==? 'v'
        if line('v') < line0
            line0 = line('v')
        else
            line1 = line('v')
        endif
        exec "normal! \<esc>"
    endif
    var text0 = ''
    var text1 = ''
    for line in range(line0, line1)
        text0 = getline(line)
        text1 = text0
        if empty(bang) && match(text0, '&\(amp\|apos\|gt\|lt\|quot\);') >= 0
            text1 = substitute(substitute(substitute(text0,
              '&amp;', '\&', 'g'), '&gt;', '>', 'g'), '&lt;', '<', 'g')
        else
            text1 = substitute(substitute(substitute(text0,
              "&", '\&amp;', 'g'), '>', '\&gt;', 'g'), '<', '\&lt;', 'g')
        endif
        if text0 != text1
            setline(line, text1)
        endif
    endfor
enddef

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

def Msg(msg = '')
    if msg =~ '^[Ww]\d*:.*'
        echohl WarningMsg
    elseif msg =~ '^[Ee]\d*:.*'
        echohl ErrorMsg
    elseif msg =~ '^--.*--$'
        echohl ModeMsg
    else
        echohl InfoMsg
    endif
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
    var bufname = ''
    var bufpath = ''
    var buftag = ''
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
    elseif empty(bufname(buf))
        bufname = '[no name]'
        bufpath = getcwd(g:statusline_winid)
    else
        bufname = '%{expand("%:p:t")}'
    endif
    bufpath = bufpath ?? expand('#' .. buf .. ':p:h')
    bufpath ..= bufpath != '/' && buftype != 'terminal' ? '/' : ''
    buftag = buftag ?? '%{&modified ? "+" : " "}'
    line =  buftag .. bufname .. sepbar .. '%*%<'
    if g:statusline_winid == win_getid(winnr())
        line ..= '%#StatusLinePath#' .. bufpath .. '%=%( %#StatusLineType#'
          .. filetype .. sepbar .. '%*%#StatusLinePct#%P' .. sepbar
          .. '%#StatusLineLen#%2L' .. sepcolon .. '%2l' .. sepbar .. '%#StatusLineLen#'
    else
        line ..= bufpath .. '%=%( ' .. filetype .. sepbar .. '%P'
          .. sepbar .. '%2L' .. sepcolon .. '%2l' .. sepbar
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
        elseif buftype == 'nofile'
            bufname = bufname =~ '\/.' ? substitute(bufname, '.*\/\ze.', '', '') : bufname
        else
            bufname = fnamemodify(bufname, ':p:t')
            bufname = bufname ?? '[no name]'
            buftag = getbufvar(buf, '&modified') && buftype != 'terminal' ? '+' : ' '
        endif
        if buftag != '+' && len(filter(buflist, buf .. ' != v:val && getbufvar(v:val, "&modified")'
          .. ' && getbufvar(v:val, "&buftype") != "terminal"')) > 0
            buftag = '*'
        endif
        line ..= (tabnum == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
          .. buftag .. bufname .. ' ' .. '%#TabLineSep#|'
        tabnum = tabnum + 1
    endwhile
    line ..= '%T%#TabLineFill#'
    return line
enddef

def VisMode(mode = 'v')
    var charnum = 0
    var chars = ''
    var line = line('.')
    exec 'normal! ' .. mode
    while 1
        if mode() !=? 'v'
            if mode ==# 'v'
                normal! gv
            else
                normal! `>v`<
                if line('.') != line
                    normal! o
                endif
            endif
        endif
        redraw
        if mode ==# 'v'
            Msg('-- VISMODE --')
        else
            Msg('-- VISMODE LINE --')
        endif
        charnum = getchar()
        if charnum == 27
            return
        endif
        if charnum == 105 || charnum == 97
            chars = nr2char(charnum)
            continue
        endif
        line = line('.')
        chars ..= nr2char(charnum)
        exec 'normal ' .. chars
        chars = ''
    endwhile
enddef

def WinMode()
    var charnum = 0
    var chars = ''
    while 1
        redraw
        Msg('-- WINMODE --')
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
        exec 'normal ' .. nr2char(23) .. chars
        chars = ''
    endwhile
enddef

def Test(arg0 = 0, arg1 = -1, arg2 = [])
    echomsg '-- Test --'
    echomsg 'arg0 = ' .. string(arg0) .. '  arg1 = ' .. string(arg1) .. '  arg2 = ' .. string(arg2)
    echomsg "line('.') = " .. line('.') .. "  line('v') = " .. line('v')
    echomsg 'v:count = ' .. v:count .. '  v:count1 = ' .. v:count1
    Msg('W: readonly buffer')
    echomsg '-- END --'
    #exec "normal! \<esc>"
enddef
nnoremap <silent> <leader>TT <scriptcmd>Test(0, 1, [0, 1, 2])<cr>
#command! -range -nargs=? Test Test(<line1>, <line2>, <args>)
#vnoremap <silent> <leader>TT :Test<cr>

defcompile
