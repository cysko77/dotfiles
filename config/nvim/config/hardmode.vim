autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Disables arrow keys but not hjkl
let g:HardMode_level = 'wannabe'
