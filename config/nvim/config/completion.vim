set completeopt+=longest,menuone

augroup ncm2_completeopt
  autocmd!
  autocmd User Ncm2PopupOpen  setlocal completeopt=noinsert,menuone,noselect
  " Do not use longest, it will still messed up when using <BS>
  " Example, you made a typo: ncm2 find nothing and call Ncm2PopupClose
  " Then you type <BS>, ncm2 will open the menu again but it will apply
  " longest before the option is changed
  autocmd User Ncm2PopupClose setlocal completeopt=menuone,preview
augroup END

" Used to close the preview window only if nothing was in it before.
" Because I used a plugin that print unit test results in it
" And it was anoying to have to preview window closed each time I completed
" something...
function! s:ClosePreviewAfterComplete() " {{{
  if &completeopt =~ 'preview' " if preview option is activated
    try
      wincmd P " Go to the preview window

      " If there is an alternate buffer and it's hidden
      if !empty(bufname('#')) && -1 == bufwinnr('#')
        buffer # " Switch back to the previous buffer
        wincmd p " Go back to the original user window
      else
        pclose
      endif

    catch
      " Do nothing if there is no preview window
      echomsg v:exception
      return
    endtry
  endif
endfunction " }}}

augroup Completion
  autocmd!
  autocmd CompleteDone * call s:ClosePreviewAfterComplete()
augroup END

inoremap <expr> <Esc> (pumvisible() ? "\<C-e>" : "\<Esc>")
inoremap <expr> <CR>  (pumvisible() ? "\<c-y>" : "\<CR>")

" vim: et ts=2 sw=2 fdm=marker
