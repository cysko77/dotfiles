" Use Phpactor for omni-completion
" Disabled  because it doesn't provide build in completion
" Example of \LogicException
" Need to see why... kind of stupid !
" autocmd FileType php setlocal omnifunc=phpactor#Complete

" let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked

" The function isn't provided by default
" I guess they want to make sure the action is possible threw the menu
" I don't care, I accept errors as long as I can be quicker
if !exists('*phpactor#ExtractConstant')
  function! phpactor#ExtractConstant()
      call phpactor#rpc("extract_constant", { "offset": phpactor#_offset(), "source": phpactor#_source(), "path": expand('%:p')})
  endfunction
endif

nnoremap yiu :call phpactor#UseAdd()<CR>

nnoremap <Leader>pp :call phpactor#ContextMenu()<CR>

nnoremap ]pn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
" TODO Look for a way to bind it to <C-]> and still get the tag follow up in
" the vim documentation
" nnoremap <C-]> :call phpactor#GotoDefinition()<CR>
nnoremap ]g :call phpactor#GotoDefinition()<CR>

nnoremap cpt :call phpactor#Transform()<CR>

command! Class :call phpactor#ClassNew()

" I wanted to use mappings starting with "y" for the extract operations
" Because we will add more text, and i generally use "y" in those cases
" But it creates a delay when I cant to copy a selection to a register
" So I choose to go for "c" because we're changing the current line
" I mostly use "s" instead of "c" anyway when I want to replace a selection
nnoremap cee :call phpactor#ExtractExpression(v:false)<CR>
vnoremap cee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

vnoremap cem :<C-U>call phpactor#ExtractMethod()<CR>

nnoremap cec :call phpactor#ExtractConstant()<CR>

" vim: et ts=2 sw=2 fdm=marker
