function! s:handleClosingParenthese() abort
  if ')' != v:char
    return
  endif

  let l:next_char = matchstr(getline('.'), '\%' . col('.') . 'c.')

  if ')' == l:next_char
    let v:char = ''
    call cursor(line('.'), col('.') + 1)
  endif
endfunction

augroup HandleClosingParenthese
  autocmd!
  autocmd InsertCharPre * :call <SID>handleClosingParenthese()
augroup END
