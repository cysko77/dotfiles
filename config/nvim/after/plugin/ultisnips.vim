if 2 != exists(':UltiSnipsEdit')
  finish
endif

function! s:try_insert(skel)
    execute "normal! i" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"

    if g:ulti_expand_res == 0
        silent! undo
        return
    endif

    " enter insert mode and advance cursor (equivalent to typing `a` instead of `i`)
    execute "startinsert"
    call cursor( line('.'), col('.') + 1)

    return g:ulti_expand_res
endfunction

function! s:InsertSkeleton() abort
    let filename = expand('%')

    " abort on non-empty buffer or exitant file
    if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
        return
    endif

    if !empty('b:projectionist')
        " Loop through projections with 'skeleton' key and try each one until the
        " snippet expands
        for [root, value] in projectionist#query('skeleton')
            echo value
            if s:try_insert(value)
                return
            endif
        endfor
    endif

    call s:try_insert('skel')
endfunction

augroup ultisnips_auto_skeleton
  autocmd!
  autocmd BufNewFile * silent! call <SID>InsertSkeleton()
augroup END

" vim: ts=2 sw=2 et fdm=marker
