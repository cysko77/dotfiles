let g:easytags_file           = '~/.tags'        " For easytags plugin, last resort file
let g:easytags_dynamic_files  = 1                " Will use vim tagfiles() to find the file to use
let g:easytags_events         = ['BufWritePost'] " To update & highlight tags after save
let g:easytags_auto_highlight = 0                " Disable the highlighting, too slow
let g:easytags_async          = 1                " Enable the asynchronous update

" completion CTAGS
nnoremap  <Leader>; <C-]>

" Option for making phpcomplete plugin work correctly
" --append=yes : Tags will be appended to the file, avoid to have multiple !_TAG lines
" --memory=-1 : otherwise the recursive mode doesn't work correctly
let g:easytags_languages = {
    \ 'php': {
        \ 'cmd':  'phpctags',
        \ 'args': [
            \ '--memory=-1',
            \ '--fields+=aimlSzn',
            \ '--append=yes'
        \ ]
    \ }
\}
" Need to disable the --sort=no and add some fields
"let g:easytags_languages = {
"    \ 'php': {
"        \ 'cmd':   'uctags',
"        \ 'args':  [
"            \ '--fields=+aimlSzn',
"            \ '--language-force=PHP',
"            \ '--output-format=e-ctags',
"        \ ]
"    \ }
"\}
