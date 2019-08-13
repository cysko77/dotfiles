" Mappings {{{
" Start completion after typing -> or ::
" Disable the time to test NCM2 and Phpactor
" inoremap <expr> -> !empty(&omnifunc) ? '-><C-x><C-o>' : '-><C-p>'
" inoremap <expr> :: !empty($omnifunc) ? '::<C-x><C-o>' : '::<C-p>'
" }}}

" php.vim configurations {{{
let g:php_html_in_strings = 1
let g:sql_type_default    = 'sqloracle' " SQL syntax colorscheme

function! s:PhpSyntaxOverride() " {{{
  hi! def link phpDocTags       phpConstants
  hi! def link phpDocParam      phpType
  hi! def link phpDocIdentifier phpIdentifier
endfunction " }}}
" }}}

augroup MyPhpConfiguration
  autocmd!
  autocmd FileType php call <Sid>PhpSyntaxOverride()
  autocmd FileType php set tags^=./.php.tags;
augroup END

" vim: et ts=2 sw=2 fdm=marker
