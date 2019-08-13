" Global PHP filetype configurations

" foldlevelstart doesn't work for ftplugin
setlocal foldlevel=1 " To automaticaly open classes folds

" Open the phpdoc for the word under the cursor
nnoremap <silent> <Leader>pk :silent execute ':!xdg-open ' .
  \ 'https://php.net/en/' . expand('<cword>')<CR>


" vim:ts=2:sw=2:et:fdm=marker
