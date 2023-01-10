vim9script

## ~/.vim/plugin/test.vim ::
# The snippets below demonstrate various ways counts, ranges, and
# motions can be passed to or used in vim9script functions.

# {}: mode
# []: optional input
# <>: required input

## normal ::
# {normal}[count]<mapping>

# pass [count] to funcion:
def FuncNorm()
    const line = line('.')
    setline(line, repeat('>', v:count1) .. getline(line))
enddef
nnoremap <leader>F1 <scriptcmd>FuncNorm()<cr>

# pass [count] to funcion, use opfunc so command can be repeated with `.`:
def FuncNorm2(count = 1, mode = '')
    if empty(mode)
        &opfunc = function('FuncNorm2', [v:count1])
        return
    endif
    const line = line('.')
    setline(line, repeat('>', count) .. getline(line))
enddef
nnoremap <leader>F2 <scriptcmd>FuncNorm2()<cr>g@_

# parse [count] to do things other than just repetitions:
def FuncNorm3()
    const line = line('.')
    if v:count1 == 1
        setline(line, '>' .. getline(line))
    elseif v:count1 == 2
        setline(line, '+' .. getline(line))
    elseif v:count1 == 3
        setline(line, '#' .. getline(line))
    elseif v:count1 == 4
        setline(line - 1, getline(line))
        setline(line + 1, getline(line))
    else
        setline(line, printf('%03d ', v:count1) .. getline(line))
    endif
enddef
nnoremap <leader>F3 <scriptcmd>FuncNorm3()<cr>

## normal/visual ::
# {normal|visual}[count]<mapping>

# pass [count] to function:
def FuncNormVis(mode = 'n')
    const count = v:count1
    var line0 = line('.')
    var line1 = line0
    if mode == 'v' || mode() ==? 'v' || mode() == "\<c-v>"
        exec "normal! \<esc>"
        line0 = getpos("'<")[1]
        line1 = getpos("'>")[1]
    endif
    for line in range(line0, line1)
        setline(line, repeat('>', count) .. getline(line))
    endfor
enddef
nnoremap <leader>F4 <scriptcmd>FuncNormVis()<cr>
vnoremap <leader>F4 <scriptcmd>FuncNormVis('v')<cr>

# pass [count] to function, use opfunc so command can be repeated with `.`:
def FuncNormVis2(count = 1, mode = '')
    if empty(mode)
        &opfunc = function('FuncNormVis2', [v:count1])
        return
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', count) .. getline(line))
    endfor
enddef
nnoremap <leader>F5 <scriptcmd>FuncNormVis2()<cr>g@_
vnoremap <leader>F5 <scriptcmd>FuncNormVis2()<cr>g@_

## operator ::
# {normal}[count]<mapping>[count]<motion>

# multiply [counts] and pass to both function and motion:
def FuncOp(mode = ''): string
    if empty(mode)
        set opfunc=FuncOp
        return 'g@'
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', v:count1) .. getline(line))
    endfor
    return ''
enddef
nnoremap <expr> <leader>F6 FuncOp()

# pass first [count] to function, pass second [count] to motion:
def FuncOp2(count = 1, mode = '')
    if empty(mode)
        &opfunc = function('FuncOp2', [v:count1])
        return
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', count) .. getline(line))
    endfor
enddef
nnoremap <leader>F7 <scriptcmd>FuncOp2()<cr>g@

# if first [count] = 1, wait for [motion]:
# if first [count] > 1, [count] lines downward as motion
# multiply [counts], pass to function and motion:
def FuncOp3(mode = ''): string
    if empty(mode)
        set opfunc=FuncOp3
        if v:count1 == 1
            return 'g@'
        else
            return 'g@g@'
        endif
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', v:count) .. getline(line))
    endfor
    return ''
enddef
nnoremap <expr> <leader>F8 FuncOp3()

## normal/visual/operator ::
# {normal}[count]<mapping><suffix>
# {visual}[count]<mapping>
# {normal}[count]<mapping>[count]<motion>

# create <suffix> mappings for quick motions (i.e. like `yy` and  `dd`)

# pass first [count] to function, pass second [count] to motion:
def FuncNormVisOp(count = 1, mode = '')
    if empty(mode)
        &opfunc = function('FuncNormVisOp', [v:count1])
        return
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', count) .. getline(line))
    endfor
enddef
nnoremap <leader>F9 <scriptcmd>FuncNormVisOp()<cr>g@
vnoremap <leader>F9 <scriptcmd>FuncNormVisOp()<cr>g@_
nnoremap <leader>F9f <scriptcmd>FuncNormVisOp()<cr>g@_

defcompile
