function! s:DefineStrategy() " {{{1
  if has('nvim')
    return 'neovim'
  " Prefere neovim strategy because I'm used to work in zoom mode with tmux
  " vimux doesn't "unzomm" so the tests doesn't appear without me doind
  " another action and another one to switch back to vim's pane and another
  " one to zoom again...
  elseif exists('*VimuxRunCommand')
    return 'vimux'
  elseif 2 == exists(':VtrSendCommandToRunner')
    return 'vtr'
  " elseif has('terminal') || exists('*term_start')
  "   return 'vimterminal'
  else
    return 'basic'
  endif
endfunction " 1}}}

" See vimux plugin and strategy when i will use tmux
let test#strategy = <SID>DefineStrategy()

" Possible if needed
" let test#strategy = {
"   \ 'nearest': 'neovim',
"   \ 'file':    'dispatch',
"   \ 'suite':   'basic',
" \}

" vim: ts=2 sw=2 et fdm=marker
