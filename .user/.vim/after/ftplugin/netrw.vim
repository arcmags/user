vim9script
## ~/.vim/after/ftplugin/netrw.vim ::

## utils ::
def CDMap(suffix = '', dir = '')
    if isdirectory(dir)
        execute 'noremap <buffer> <silent> cd' .. suffix .. ' <Cmd>silent edit ' .. dir .. '<CR>'
    else
        execute 'noremap <buffer> <silent> cd' .. suffix .. ' <Nop>'
    endif
enddef

defcompile

## mappings ::
CDMap('.', $UDIR .. '/.user')
CDMap('d', $UDIR .. '/dat')
CDMap('e', $TMPDIR .. '/web-dl')
CDMap('g', $UDIR .. '/git')
CDMap('l', $UDIR .. '/local')
CDMap('m', '/mnt')
CDMap('s', $UDIR .. '/sync')
CDMap('t', $TMPDIR)
CDMap('u', $UDIR)
CDMap('w', $UDIR .. '/sync/www')

# buffer: next/previous:
nnoremap <buffer> <silent> <C-n> <ScriptCmd>call BufNav('next')<CR>
nnoremap <buffer> <silent> <C-p> <ScriptCmd>call BufNav('prev')<CR>
nnoremap <buffer> <silent> <C-w><C-n> <ScriptCmd>call BufNav('next')<CR>
nnoremap <buffer> <silent> <C-w><C-p> <ScriptCmd>call BufNav('prev')<CR>
nnoremap <buffer> <silent> <C-w>n <ScriptCmd>call BufNav('next')<CR>
nnoremap <buffer> <silent> <C-w>p <ScriptCmd>call BufNav('prev')<CR>

## functions ::
def BufNav(nav = 'next')
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val) && bufnr("%") != v:val')) == 0
        silent enew
    else
        execute 'silent b' .. nav
    endif
enddef

defcompile
