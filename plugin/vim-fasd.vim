" Author:   Simon Heimlicher
" Homepage: http://github.com/simonair/vim-fasd

if exists('g:loaded_vim_fasd') || &cp
  finish
endif
let g:loaded_vim_fasd = 1

function! s:VimFasd(...)
    if a:0 == 0
        let cmd = 'fasd -d -s'
        echo system(cmd)
    else
        "echom 'args="'.join(a:000,'|').'"'
        let cmd = "fasd -d -e 'printf %s' " . shellescape(join(a:000,' '))
        "echom 'cmd="'.cmd.'"'
        let target_dir = system(cmd)
        "echom 'target_dir="'.target_dir.'"'
        if empty(target_dir)
            finish
        endif
        execute 'cd' fnameescape(target_dir)
    endif
endfunction
command! -nargs=* Fasd call s:VimFasd(<f-args>)
