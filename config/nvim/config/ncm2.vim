" Enable NCM2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" enable auto complete for `<backspace>`, `<c-w>` keys.
" known issue https://github.com/ncm2/ncm2/issues/7
" au TextChangedI * call ncm2#auto_trigger()

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" To disable the autopopup if need
" let g:ncm2#auto_popup = 0
" imap <C-Space> <Plug>(ncm2_manual_trigger)

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
augroup ncm2_add_sources
  autocmd!
  autocmd User Ncm2Plugin call ncm2#register_source({
    \ 'name' :            'css',
    \ 'priority':         9,
    \ 'subscope_enable':  1,
    \ 'scope':            ['css','scss'],
    \ 'mark':             'css',
    \ 'word_pattern':     '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete':      ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
  \ })
augroup END

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<Plug>(ely_cr_popup)", 'm')
" A little trick here, for ncm2 when you press <CR> you alays want a <CR> to
" be inserted
" I don't work like that, I want to complete with <CR> but let the cursor on
" the same line
" Due to the way the expand_or function works the keys you provide will always
" be executed, no matter what.
" So I check first if the popup is open, if it's not then I insert a <CR>
" otherwise I let ncm2 decide if there is a snippet to expand or not, but I
" don't provide any keys to add
inoremap <silent> <expr> <CR> pumvisible() ? ncm2_ultisnips#expand_or('', 'n') : "\<CR>"

let g:endwise_no_mappings = 0 " Try to make the map use <C-r>= instead...

" vim: et ts=2 sw=2 fdm=marker
