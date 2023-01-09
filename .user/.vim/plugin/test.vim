vim9script
## ~/.vim/plugin/test.vim ::

# This script contains several example functions, mappings, and commands.

# normal mode, may take a count:
def FuncNorm()
    var line = line('.')
    setline(line, repeat('>', v:count1) .. getline(line))
enddef
nnoremap <leader>F1 <scriptcmd>FuncNorm()<cr>

# normal/visual mode, may take a count:
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
nnoremap <leader>F2 <scriptcmd>FuncNormVis()<cr>
vnoremap <leader>F2 <scriptcmd>FuncNormVis('v')<cr>

# operator (before motion), may take a count passed to function and motion:
# action may be repeated with: ``.``
# TODO: enable normal/visual mode repeats with ``.`` by calling this function:
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
nnoremap <expr> <leader>F3 FuncOp()

# operator (before motion), may take a count passed to function or a motion:
# A count (>1) before operator sets motion to <count> lines downward: ``<count><operator>``.
# No count before operator waits for motion: ``<operator><motion>``.
def FuncOp2(mode = ''): string
    if empty(mode)
        set opfunc=FuncOp2
        if v:count1 == 1
            return 'g@'
        else
            return 'g@g@'
        endif
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', v:count1) .. getline(line))
    endfor
    return ''
enddef
nnoremap <expr> <leader>F4 FuncOp2()

# TODO: get count before operator to pass to function but not motion:
# A count before operator passes to the motion and the function: ``<count><operator><motion>``.
# It would be great to have that count not pass to the motion.
# A count can still pass to the motion by prefixing it directly: ``<operator><count><motion>``.
# Ideally, both counts could be parsed separately: ``<count><operator><count><motion>``...
def FuncOp3(mode = ''): string
    if empty(mode)
        set opfunc=FuncOp3
        return 'g@'
    endif
    var line0 = getpos("'[")[1]
    var line1 = getpos("']")[1]
    for line in range(line0, line1)
        setline(line, repeat('>', v:count1) .. getline(line))
    endfor
    return ''
enddef
nnoremap <expr> <leader>F5 FuncOp3()

# normal/visual/operator, may be used before a motion, may take a count
# (passed to motion or normal/visual modes):
def FuncNormVisOp(mode = ''): string
    if empty(mode)
        setl opfunc=FuncNormVisOp
        return 'g@'
    endif
    var count = v:count1
    var line0 = line('.')
    var line1 = line0
    if mode == 'v'
        exec "normal! \<esc>"
        line0 = getpos("'<")[1]
        line1 = getpos("'>")[1]
    elseif mode != 'n'
        count = 1
        line0 = getpos("'[")[1]
        line1 = getpos("']")[1]
    endif
    for line in range(line0, line1)
        setline(line, repeat('>', count) .. getline(line))
    endfor
    return ''
enddef
nnoremap <expr> <leader>F6 FuncNormVisOp()
vnoremap <leader>F6 <scriptcmd>FuncNormVisOp('v')<cr>
nnoremap <leader>F6f <scriptcmd>FuncNormVisOp('n')<cr>

defcompile
