" For pdv.vim plugin

let b:pdv_disable_ultisnips = 0

let b:pdv_template_dir = {
  \ 'ultisnips': fnamemodify(resolve(expand('<sfile>')), ':p:h:h:h') . '/templates/UltiSnips/pdv'
\}

" vim:ts=2:sw=2:et:fdm=marker
