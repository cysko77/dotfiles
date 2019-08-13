" Disabled the time to test NCM2 and Phpactor
" let g:SuperTabDefaultCompletionType        = 'context' " Will try to recognize which completion use
" let g:SuperTabContextDefaultCompletionType = "<C-p>"
" let g:SuperTabLongestEnhanced              = 1
" let g:SuperTabLongestHighlight             = 1
" let g:SuperTabCrMapping                    = 1

" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" " let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery =
"       \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" " To start SuperTab with <C-Space>
" imap <C-Space> <Plug>SuperTabForward

" " To make <C-Space> working in a terminal
" if !has("gui_running")
"     imap <C-@> <C-Space>
" endif

" " Mean :
" " if text looks like a file path
" "   use file completion
" " otherwise if text looks like an attempt to access to an object member
" "   use omni completion
" "   if no results
" "     use vim completion
" " else
" "   use keyword completion

" autocmd FileType *
"   \ if &omnifunc != '' |
"   \   call SuperTabChain(&omnifunc, "<C-x><C-v>") |
"   \ endif
