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
# TODO: fix <C-Space> mapping inside tmux?
# TODO: path substitution $HOME > ~ in statusbar
# TODO: add comments to everything
# TODO: make BufClose take args: hidden, all, etc, ...

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
    autocmd BufEnter * silent! lcd %:p:h
    autocmd BufWritePre * SpaceTrim() | LineTrim()
augroup END

## mappings ::
g:mapleader = ";"
set cedit=<C-q>
set wildcharm=<C-n>
nnoremap <silent> <C-w>m <C-w>x
nnoremap <silent> <leader>V <ScriptCmd>call VisMode('V')<CR>
nnoremap <silent> <leader>v <ScriptCmd>call VisMode('v')<CR>
nnoremap <silent> <leader>w <ScriptCmd>call WinMode()<CR>
noremap <silent> <M-x> <C-x>
noremap <silent> <leader>Q Q
noremap Q <Nop>
noremap \ ;
noremap R gR
noremap gR R

# buffer: new:
nnoremap <silent> <C-w><C-e> <Cmd>Explore<CR>
nnoremap <silent> <C-w>N <Cmd>enew<CR>
nnoremap <silent> <C-w>\ <Cmd>terminal ++curwin ++noclose<CR>
nnoremap <silent> <C-w>e <Cmd>Explore<CR>

# buffer: save:
cnoremap <silent> <C-s> <C-c>:write<CR>
inoremap <silent> <C-s> <Esc><Cmd>write<CR>
nnoremap <silent> <C-s> <Cmd>write<CR>
vnoremap <silent> <C-s> <Esc><Cmd>write<CR>

# buffer: close:
nnoremap <silent> <C-w><C-x> <ScriptCmd>call BufClose('')<CR>
nnoremap <silent> <C-w>X <ScriptCmd>call BufClose('!')<CR>
nnoremap <silent> <C-w>x <ScriptCmd>call BufClose('')<CR>
nnoremap <silent> <C-x> <ScriptCmd>call BufClose('')<CR>
tnoremap <silent> <C-w><C-x> <ScriptCmd>call BufClose('')<CR>
tnoremap <silent> <C-w>X <ScriptCmd>call BufClose('!')<CR>
tnoremap <silent> <C-w>x <ScriptCmd>call BufClose('')<CR>
tnoremap <silent> <C-x> <ScriptCmd>call BufClose('')<CR>

# buffer: next/previous:
nnoremap <silent> <C-n> <ScriptCmd>call BufNext()<CR>
nnoremap <silent> <C-p> <ScriptCmd>call BufPrev()<CR>
nnoremap <silent> <C-w><C-n> <ScriptCmd>call BufNext()<CR>
nnoremap <silent> <C-w><C-p> <ScriptCmd>call BufPrev()<CR>
nnoremap <silent> <C-w>n <ScriptCmd>call BufNext()<CR>
nnoremap <silent> <C-w>p <ScriptCmd>call BufPrev()<CR>
tnoremap <silent> <C-w><C-n> <ScriptCmd>call BufNext()<CR>
tnoremap <silent> <C-w><C-p> <ScriptCmd>call BufPrev()<CR>
tnoremap <silent> <C-w>n <ScriptCmd>call BufNext()<CR>
tnoremap <silent> <C-w>p <ScriptCmd>call BufPrev()<CR>

# buffer: list
nnoremap <C-w>B <ScriptCmd>BufList!<CR>:buf<Space>
nnoremap <C-w>b <ScriptCmd>BufList<CR>:buf<Space>

# window: new:
nnoremap <silent> <C-w>` <Cmd>terminal ++noclose<CR><Cmd>resize 8<CR>

# window: close:
nnoremap <silent> <C-c> <ScriptCmd>call WinClose('')<CR>
nnoremap <silent> <C-q> <ScriptCmd>call WinClose('')<CR>
nnoremap <silent> <C-w><C-c> <ScriptCmd>call WinClose('')<CR>
nnoremap <silent> <C-w><C-q> <ScriptCmd>call WinClose('')<CR>
nnoremap <silent> <C-w>C <ScriptCmd>call WinClose('!')<CR>
nnoremap <silent> <C-w>Q <ScriptCmd>call WinClose('!')<CR>
nnoremap <silent> <C-w>c <ScriptCmd>call WinClose('')<CR>
nnoremap <silent> <C-w>q <ScriptCmd>call WinClose('')<CR>
tnoremap <silent> <C-w><C-c> <ScriptCmd>call WinClose('')<CR>
tnoremap <silent> <C-w><C-q> <ScriptCmd>call WinClose('')<CR>
tnoremap <silent> <C-w>C <ScriptCmd>call WinClose('!')<CR>
tnoremap <silent> <C-w>Q <ScriptCmd>call WinClose('!')<CR>
tnoremap <silent> <C-w>c <ScriptCmd>call WinClose('')<CR>
tnoremap <silent> <C-w>q <ScriptCmd>call WinClose('')<CR>

# tab: move:
nnoremap <silent> <C-w>GT <ScriptCmd>call TabLeft()<CR>
nnoremap <silent> <C-w>Gt <ScriptCmd>call TabRight()<CR>

# tab: new:
nnoremap <silent> <C-w><C-t> <Cmd>execute 'tabnew' .. (@% == "" ? "" : " %")<CR>
nnoremap <silent> <C-w>t <Cmd>execute 'tabnew' .. (@% == "" ? "" : " %")<CR>

# text: format:
nnoremap <silent> <leader>0 <ScriptCmd>call SpaceTrim()<CR><ScriptCmd>call LineTrim()<CR>
nnoremap <silent> <leader>1 Vip:keeppatterns s/ \+/\r/g<CR>
nnoremap <silent> <leader>D <ScriptCmd>call Date('!')<CR>
nnoremap <silent> <leader>J VipJ
nnoremap <silent> <leader>d <ScriptCmd>call Date('')<CR>
nnoremap <silent> <leader>f gqip
nnoremap <silent> <leader>S Vip:sort<CR>:echo 'sorted'<CR>
nnoremap <silent> <leader>s Vip:sort /^[^A-Za-z0-9]*/<CR>:echo 'sorted'<CR>
noremap <silent> <leader>U <ScriptCmd>call CommentToggle('!')<CR>
noremap <silent> <leader>h <ScriptCmd>call HTMLToggle()<CR>
noremap <silent> <leader>u <ScriptCmd>call CommentToggle('')<CR>
vnoremap <silent> <leader>1 :keeppatterns s/ \+/\r/g<CR>
vnoremap <silent> <leader>f gq
vnoremap <silent> <leader>S :sort<CR>:echo 'sorted'<CR>
vnoremap <silent> <leader>s :sort /^[^A-Za-z0-9]*/<CR>:echo 'sorted'<CR>

# text: move lines:
#nnoremap <silent> <M-j> mz:m+<CR>`z
#nnoremap <silent> <M-k> mz:m-2<CR>`z
#vnoremap <silent> <M-j> :m'>+<CR>`<my`>mzgv`yo`z
#vnoremap <silent> <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

# text: put/yank:
noremap <silent> Y yg_
if exists('$DISPLAY') && executable('xclip')
    nnoremap <silent> <leader>y <Cmd>yank<Bar>call system('xclip -sel clipboard',@0)<CR>
    vnoremap <silent> <leader>y y<CR>:call system('xclip -sel clipboard',@0)<CR>
    noremap <silent> <leader>p :let @x = system('xclip -sel clipboard -o')<CR>"xp
endif

# text: search:
nnoremap <leader>/ /<C-r><C-w>
nnoremap <leader>? ?<C-r><C-w>
nnoremap <leader>r :%s/<C-r><C-w>/
vnoremap <leader>/ y/\V<C-R>=escape(@",'/\')<CR>
vnoremap <leader>? y?\V<C-R>=escape(@",'/\')<CR>
vnoremap <leader>r y:%s/\V<C-R>=escape(@",'/\')<CR>/

# navigation: indent:
noremap <silent> [+ <ScriptCmd>call IndentNav(['prev', 'more'])<CR>
noremap <silent> [- <ScriptCmd>call IndentNav(['prev', 'less'])<CR>
noremap <silent> [= <ScriptCmd>call IndentNav(['prev', 'same'])<CR>
noremap <silent> ]+ <ScriptCmd>call IndentNav(['next', 'more'])<CR>
noremap <silent> ]- <ScriptCmd>call IndentNav(['next', 'less'])<CR>
noremap <silent> ]= <ScriptCmd>call IndentNav(['next', 'same'])<CR>

# navigation: line:
noremap <silent> <C-j> gj
noremap <silent> <C-k> gk

# vim: toggle:
nnoremap <silent> <leader>'<Space> <Cmd>let @/=''<Bar>echo '"/ = ""'<CR>
nnoremap <silent> <leader>'M <Cmd>setlocal modifiable!<Bar>setlocal modifiable?<CR>
nnoremap <silent> <leader>'N <Cmd>setlocal relativenumber!<Bar>setlocal relativenumber?<CR>
nnoremap <silent> <leader>'R <Cmd>setlocal readonly!<Bar>setlocal readonly?<CR>
nnoremap <silent> <leader>'b <Cmd>setlocal buflisted!<Bar>setlocal buflisted?<CR>
nnoremap <silent> <leader>'c <Cmd>setlocal cursorcolumn!<Bar>setlocal cursorcolumn?<CR>
nnoremap <silent> <leader>'l <Cmd>setlocal cursorline!<Bar>setlocal cursorline?<CR>
nnoremap <silent> <leader>'m <Cmd>setlocal modified!<Bar>setlocal modified?<CR>
nnoremap <silent> <leader>'n <Cmd>setlocal number!<Bar>setlocal number?<CR>
nnoremap <silent> <leader>'p <Cmd>setlocal paste!<Bar>setlocal paste?<CR>
nnoremap <silent> <leader>'s <Cmd>setlocal spell!<Bar>setlocal spell?<CR>
nnoremap <silent> <leader>'t <Cmd>execute 'set showtabline=' .. (&showtabline + 1) % 3<Bar>set showtabline?<CR>
nnoremap <silent> <leader>'w <Cmd>setlocal wrap!<Bar>setlocal wrap?<CR>
nnoremap <silent> <leader>'z <ScriptCmd>call ScrollToggle()<CR>
nnoremap <silent> <leader><Space> <Cmd>execute v:hlsearch ? ':noh<Bar>echo "nohlsearch"' : ':set hls<Bar>echo "  hlsearch"'<CR>

# vim: query:
nnoremap <silent> <leader>"M <Cmd>setlocal modifiable?<CR>
nnoremap <silent> <leader>"R <Cmd>setlocal readonly?<CR>
nnoremap <silent> <leader>"b <Cmd>setlocal buflisted?<CR>
nnoremap <silent> <leader>"f <Cmd>echo &filetype<CR>
nnoremap <silent> <leader>"h <ScriptCmd>call HiGroup()<CR>
nnoremap <silent> <leader>"p <Cmd>setlocal paste?<CR>

# vim: reload:
noremap <silent> <leader><C-l> <Cmd>source ~/.vimrc<Bar>nohlsearch<CR><Cmd>echo 'source ~/.vimrc'<CR>

# command mode:
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-f> <Right>
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <C-e>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-k> <C-k>
cnoremap <M-v> <C-q>
cnoremap <expr> <C-c> pumvisible() ? '<C-e>' : '<C-c>'
cnoremap <expr> <C-e> pumvisible() ? '<C-e>' : '<End>'
cnoremap <expr> <C-u> pumvisible() ? '<C-e>' : '<C-u>'

# insert mode:
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-f> <Right>
inoremap <C-g> <C-d>
inoremap <C-h> <BS>
inoremap <C-l> <C-e>
inoremap <M-b> <S-Left>
inoremap <M-f> <S-Right>
inoremap <expr> <C-c> pumvisible() ? '<C-e>' : '<C-c>'
inoremap <expr> <C-e> pumvisible() ? '<C-e>' : '<End>'
inoremap <expr> <C-u> pumvisible() ? '<C-e>' : '<C-u>'

# terminal mode:
tnoremap <C-w><C-w> <C-w>w
tnoremap <silent> <C-\><C-n> <C-\><C-n><Cmd>setlocal nonumber<CR>
tnoremap <silent> <C-\>N <C-\><C-n><Cmd>setlocal nonumber<CR>
tnoremap <silent> <C-\>n <C-\><C-n><Cmd>setlocal nonumber<CR>
tnoremap <silent> <C-w><C-n> <C-w>N<Cmd>setlocal nonumber<CR>
tnoremap <silent> <C-w>N <C-w>N<Cmd>setlocal nonumber<CR>

## commands ::
command! -bang BufList BufList(<q-bang>)
command! -nargs=+ -complete=command OutCap OutCap(<q-args>)
command! -nargs=? Cmd CmdExec(<q-args>)
command! -nargs=? CntSet CntSet(<args>)
command! -nargs=? Sh execute 'silent ! ' .. <q-args> | redraw!
command! BufWipeHidden BufWipeHidden()
command! TabLeft TabLeft()
command! TabRight TabRight()
command! VidirClean VidirClean()
command! VidirTitle VidirTitle()

## functions ::
def BufClose(bang = '')
    const buf = bufnr('%')
    const filetype = getbufvar(buf, '&filetype')
    const buftype = filetype == 'netrw' ? 'netrw' : getbufvar(buf, '&buftype')
    const wincurrent = winnr()
    var cmd = 'bwipeout'
    var cmdbang = bang
    if index(['help', 'netrw', 'terminal'], buftype) >= 0
        cmdbang = '!'
    endif
    if empty(cmdbang) && getbufvar(buf, '&modified')
        MsgError('E: unsaved buffer modified')
        return
    endif
    for tab in range(1, tabpagenr('$'))
        tabnext
        for win in filter(range(1, winnr('$')), 'winbufnr(v:val) == ' .. buf)
            execute ':' .. win .. 'wincmd w'
            if len(filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != ' .. buf)) > 0
                silent bprevious
            else
                execute 'enew'
            endif
        endfor
    endfor
    execute ':' .. wincurrent .. 'wincmd w'
    if bufexists(buf)
        execute cmd .. cmdbang .. ' ' .. buf
    endif
enddef

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

def BufNext()
    if ! &buflisted && &filetype == 'netrw'
        echo 'netrw'
        const buf = bufnr('%')
        if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 0
            silent enew
        else
            silent bnext
        endif
        execute 'bwipeout! ' .. buf
    else
        silent bnext
    endif
enddef

def BufPrev()
    if ! &buflisted && &filetype == 'netrw'
        echo 'netrw'
        const buf = bufnr('%')
        if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 0
            silent enew
        else
            silent bprevious
        endif
        execute 'bwipeout! ' .. buf
    else
        silent bprevious
    endif
enddef

def BufWipeHidden()
    const bufs = filter(range(1, bufnr('$')), 'bufexists(v:val) && !(bufloaded(v:val)) && !(buflisted(v:val))')
    for buf in bufs
        execute 'bwipeout! ' .. buf
    endfor
enddef

def CommentToggle(bang = '')
    if &modifiable == false
        return
    endif
    var line1 = line('.')
    var line2 = line1
    if index(['V', 'v'], mode()) >= 0
        if line('v') < line('.')
            line1 = line('v')
        elseif line('v') > line('.')
            line2 = line('v')
        endif
        execute "normal! \<Esc>"
    endif
    var begin = '#'
    var end = ''
    if index(['c', 'cpp', 'go', 'java', 'javascript', 'php', 'rust'], &filetype) >= 0
        begin = '//'
    elseif &filetype == 'sql'
        begin = '--'
    elseif &filetype == 'tex'
        begin = '%'
    elseif &filetype == 'vim'
        begin = '"'
        var l = 1
        while l < line1
            if match(getline(l), '^\s*vim9script\>.*') >= 0
                begin = '#'
                break
            endif
            l += 1
        endwhile
    elseif index(['xdefaults', 'xmodmap'], &filetype) >= 0
        begin = '!'
    elseif &filetype == 'html'
        begin = '<!--'
        end = '-->'
    elseif &filetype == 'css'
        begin = '/\*'
        end = '\*/'
    endif
    const regex_comment = '\(^\s*\)' .. begin .. '\(.\{-}\)' .. end .. '\s*$'
    const regex_heading = '^\s*\(' .. begin .. '\)\+\s.\{-}' .. end .. '\s*$'
    const regex_line = '^\(\s*\)\(.\{-}\)\s*$'
    const sub_comment = '\1' .. begin .. '\2' .. end
    const sub_line = '\1\2\3'
    var text = ''
    var text_out = ''
    for line in range(line1, line2)
        text = getline(line)
        text_out = text
        if match(text, '^\s*$') >= 0 || match(text, regex_heading) >= 0 || (bang == '!' && end == '\*/')
            continue
        endif
        if bang == '!' || match(text, regex_comment) < 0
            text_out = substitute(text, regex_line, sub_comment, '')
        else
            text_out = substitute(text, regex_comment, sub_line, '')
        endif
        if text != text_out
            setline(line, text_out)
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
    const c = getpos('.')[2]
    const text = getline('.')
    var date = strftime('%F')
    var regex_date = '\d\d\d\d-\d\d-\d\d'
    if bang == '!'
        date = strftime('%F_%H:%M')
        regex_date = '\d\d\d\d-\d\d-\d\d_\d\d:\d\d'
    endif
    if match(text, regex_date) >= 0
        setline('.', substitute(text, '\(.\{-}\)' .. regex_date .. '\(.*\)',
          '\1' .. date .. '\2', ''))
    else
        setline('.', text[0 : c] .. date .. text[c : -1])
    endif
enddef

def HiGroup()
    echo 'hi=' .. synIDattr(synID(line('.'), col('.'), 1), 'name')
    echon '  trans=' .. synIDattr(synID(line('.'), col('.'), 0), 'name')
    echon '  lo=' .. synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
enddef

def HTMLToggle()
    var line1 = line('.')
    var line2 = line1
    if index(['V', 'v'], mode()) >= 0
        if line('v') < line('.')
            line1 = line('v')
        elseif line('v') > line('.')
            line2 = line('v')
        endif
        execute "normal! \<Esc>"
    endif
    var text = ''
    var text_out = ''
    for line in range(line1, line2)
        text = getline(line)
        text_out = text
        if match(text, '&\(amp\|apos\|gt\|lt\|quot\);') >= 0
            text_out = substitute(substitute(substitute(substitute(substitute(text,
              '&amp;', '\&', 'g'), '&apos;', "'", 'g'), '&gt;', '>', 'g'),
              '&lt;', '<', 'g'), '&quot;', '"', 'g')
        else
            text_out = substitute(substitute(substitute(substitute(substitute(text,
              "&", '\&amp;', 'g'), "'", '\&apos;', 'g'), '>', '\&gt;', 'g'),
              '<', '\&lt;', 'g'), '"', '\&quot;', 'g')
        endif
        if text != text_out
            setline(line, text_out)
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

def LineTrim()
    if &readonly
        return
    endif
    var pos = getpos(".")
    :%s/\($\n\s*\)\+\%$//e
    setpos(".", pos)
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

def OutCap(cmd = '')
    if cmd == ''
        return
    endif
    var output = ''
    redir => output
    silent execute 'legacy ' .. cmd
    redir END
    if !empty(output)
        enew
        silent put =output
        setlocal nomodified
    endif
enddef

def ScrollToggle()
    if &scrolloff == 999
        setlocal scrolloff<
    else
        setlocal scrolloff=999
    endif
    setlocal scrolloff?
enddef

def SpaceTrim()
    if &readonly
        return
    endif
    var pos = getpos(".")
    :%s/\s\+$//e
    setpos(".", pos)
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
        line ..= '%#StatusLinePath#' .. bufpath .. '%=%( %#StatusLineType#'
            .. filetype .. sepbar .. '%*%#StatusLinePct#%P' .. sepbar
            .. '%#StatusLineLen#%2L' .. sepcolon .. '%2l' .. sepbar .. '%#StatusLineLen#'
    else
        line ..= bufpath .. '%=%( ' .. filetype .. sepbar
            .. '%P' .. sepbar .. '%2L' .. sepcolon .. '%2l' .. sepbar
    endif
    line ..= '%2{strlen(getline("."))}' .. sepcolon .. '%2c %)'
    return line
enddef

def TabLeft()
    if tabpagenr() == 1
        tabmove
    else
        tabmove -1
    endif
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
        line ..= (tabnum == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
            .. buftag .. bufname .. ' ' .. '%#TabLineSep#|'
        tabnum = tabnum + 1
    endwhile
    line ..= '%T%#TabLineFill#'
    return line
enddef

def TabRight()
    if tabpagenr() == tabpagenr('$')
        tabmove 0
    else
        tabmove +
    endif
enddef

def VidirClean()
    silent keeppatterns :%s/\.\([A-Za-z0-9]\{1,4\}\)$/\L.\1/e
enddef

def VidirTitle()
    VidirClean()
    silent keeppatterns :%s/\(^\| \+\)\(\w\)\(\w*\)/\u\2\L\3/ge
    silent keeppatterns :%s/[^A-Za-z0-9 \t\.\/_-]//ge
    silent keeppatterns :%s/ \+\(\w\)\(\w*\)/\u\1\L\2/ge
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

def WinClose(bang = '')
    if len(range(1, tabpagenr('$'))) > 1 || len(range(1, winnr('$'))) > 1
        execute 'close' .. bang
    else
        for buf in filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"')
            silent execute 'bdelete! ' .. buf
        endfor
        const bufs = filter(range(1, bufnr('$')), 'buflisted(v:val)')
        const bufsclean = filter(copy(bufs), '!getbufvar(v:val, "&modified")')
        if empty(bang) && len(bufsclean) != len(bufs)
            if len(bufsclean) > 0
                silent execute 'bdelete ' .. join(bufsclean, ' ')
            endif
            MsgError('E: unsaved buffer modified')
            return
        endif
        execute 'qall' .. bang
    endif
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
