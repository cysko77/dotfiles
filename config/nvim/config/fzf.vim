" searching with a preview and include gitignored files.
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--skip-vcs-ignores',
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%'),
      \                 <bang>0)

"" Search word under cursor.
nnoremap <Plug>(search-cursor-word) :Ag <C-R><C-W><CR>
nmap <leader>sw <Plug>(search-cursor-word)

"" Search tags for cursor word.
nnoremap <Plug>(search-cursor-word-tags) :Tags <C-R><C-W><CR>
nmap <leader>st <Plug>(search-cursor-word-tags)

"" History of opened files.
nnoremap <Plug>(file-history) :History<CR>
nmap <leader>h <Plug>(file-history)
nmap <C-e> <Plug>(file-history)

"" Search history.
nnoremap <Plug>(search-history) :History/<CR>
nmap <leader>sh <Plug>(search-history)

"" Ctrl + b, list open buffers. I use this alot.
nmap <C-b> :Buffers<CR>

"" Fuzzy find files.
map <C-f> :FZF<CR>
