" Disabled the possibility to run a test from it's source file
" let g:test#no_alternate = 1 " Ex.: Don't run tests on save from the sources

nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

" " Disable because it doesn't leave the focus in the neovim terminal
" " So I can't close it quicly, which is my favorite thing :)
" augroup auto_vimtest_on_write " {{{1
"   autocmd!
"   autocmd BufWrite * if test#exists() |
"     \   TestFile |
"     \ endif
" augroup END " 1}}}

" vim: ts=2 sw=2 et fdm=marker
