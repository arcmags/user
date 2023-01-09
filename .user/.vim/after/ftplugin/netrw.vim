vim9script
## ~/.vim/after/ftplugin/netrw.vim ::

## env ::
const HOME = isdirectory($HOME) ? resolve($HOME) : ''
const UDIR = isdirectory($UDIR) ? resolve($UDIR) : ''

## utils ::
def CDMap(suffix = '', dir = '')
    execute 'nnoremap <buffer> <silent> cd' .. suffix .. ' '
      .. (isdirectory(dir) ? '<cmd>silent edit ' .. dir .. '<cr>' : '<nop>')
enddef
defcompile

## mappings ::
CDMap('.', UDIR .. '/.user')
CDMap('<cr>', HOME)
CDMap('d', UDIR .. '/dat')
CDMap('g', UDIR .. '/git')
CDMap('l', UDIR .. '/local')
CDMap('m', '/mnt')
CDMap('s', UDIR .. '/sync')
CDMap('t', $TMPDIR)
CDMap('u', UDIR)
CDMap('w', UDIR .. '/sync/www')

# buffer: next/previous:
nnoremap <buffer> <C-n> <ScriptCmd>call BufNav('next')<CR>
nnoremap <buffer> <C-p> <ScriptCmd>call BufNav('prev')<CR>
nnoremap <buffer> <C-w><C-n> <ScriptCmd>call BufNav('next')<CR>
nnoremap <buffer> <C-w><C-p> <ScriptCmd>call BufNav('prev')<CR>
nnoremap <buffer> <C-w>n <ScriptCmd>call BufNav('next')<CR>
nnoremap <buffer> <C-w>p <ScriptCmd>call BufNav('prev')<CR>

## functions ::
def BufNav(nav = 'next')
    execute 'silent ' .. (len(filter(range(1, bufnr('$')),
      'buflisted(v:val) && bufnr("%") != v:val')) > 0 ? 'b' .. nav : 'enew')
enddef

defcompile
