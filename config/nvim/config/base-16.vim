set background=dark

if !has('gui_running') && !exists('g:base16_shell_path')
  let g:base16_shell_path = '~/.dotfiles/base16/base16-shell/scripts'
endif

if !exists('g:base16_theme') || empty(globpath(&runtimepath, 'colors/' . g:base16_theme . '.vim'))
  let g:base16_theme = !empty($BASE16_THEME) ? $BASE16_THEME : 'base16-gruvbox-dark-medium'
endif

if !exists('g:colors_name') || g:colors_name != g:base16_theme
  let base16colorspace=256

  silent! execute 'colorscheme ' . g:base16_theme
endif
