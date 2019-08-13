" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <expr> <CR> ncm2_snipmate#expand_or("\<CR>", 'n')

" wrap <Plug>snipMateTrigger so that it works for both completin and normal
" snippet
" inoremap <expr> <c-u> ncm2_snipmate#expand_or("\<Plug>snipMateTrigger", "m")

" c-j c-k for moving in snippet
let g:snips_no_mappings = 1
" vmap <c-j> <Plug>snipMateNextOrTrigger
" vmap <c-k> <Plug>snipMateBack
" imap <expr> <c-k> pumvisible() ? "\<c-y>\<Plug>snipMateBack" : "\<Plug>snipMateBack"
" imap <expr> <c-j> pumvisible() ? "\<c-y>\<Plug>snipMateNextOrTrigger" : "\<Plug>snipMateNextOrTrigger"
