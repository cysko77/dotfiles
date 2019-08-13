" External configuration {{{
" Will always add the directory of this file to the runtimepath
" Allow me to move all the vim-config repository inside my .dotfiles/
let s:my_vim_dir = fnamemodify(resolve(expand('<sfile>')), ':p:h')
execute 'set runtimepath^=' . s:my_vim_dir
execute 'set runtimepath+=' . s:my_vim_dir . '/after'
let &packpath = &runtimepath

" }}}


" Global {{{
"Enable 256 color terminal
set t_Co=256
let mapleader = ','

filetype plugin indent on
syntax on

" Try to user Vim 'funzy' finder
set path+=**
set noautochdir
" The goal is to speed up the find mainly, try and check if that doesn't screw
" something up
set wildignore+=*/vendor/*,*/node_modules/*,*/var/*,*/web/build/*

" If installed using git
set rtp+=~/.fzf

" set mouse=a " Try to force myself to not use the mouse
set hidden
set number
set relativenumber
set cursorline
set laststatus=2
set modelines=5
set ts=4 sts=4 sw=4 expandtab
set listchars=tab:»\ ,eol:¬
set incsearch
set nojoinspaces
set display+=lastline
set splitright
set scrolloff=3
set diffopt+=vertical
set wildmenu

" To add a personal templates directory to the runtimepath
execute 'set runtimepath+=' . s:my_vim_dir . '/templates'


if has("termguicolors")     " set true colors
  set termguicolors
  let g:airline_theme='gruvbox'
endif


if has('nvim')
  set inccommand=nosplit
endif
" }}}

" Packages {{{
" Minpack {{{

" Needed to autoload packages depending on filetype
if exists('*minpac#init')
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('chriskempson/base16-vim')
  call minpac#add('morhetz/gruvbox')
  "  call minpac#add('wikitopian/hardmode')

  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')

  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  "call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('wsdjeg/FlyGrep.vim')
  call minpac#add('w0rp/ale')

  call minpac#add('easymotion/vim-easymotion')

  call minpac#add('junegunn/fzf',{'dir': '.fzf','do' : './install --all'})
  call minpac#add('junegunn/fzf.vim')

  call minpac#add('skywind3000/asyncrun.vim')

  " call minpac#add('ervandew/supertab')
  call minpac#add('vim-syntastic/syntastic')

  call minpac#add('godlygeek/tabular')
  call minpac#add('junegunn/vim-easy-align')

  call minpac#add('StanAngeloff/php.vim')
  " call minpac#add('shawncplus/phpcomplete.vim')
  call minpac#add('phpactor/phpactor', {'do': '!composer install --no-dev -o'})
  call minpac#add('ncm2/ncm2')
  call minpac#add('roxma/nvim-yarp')
  call minpac#add('ncm2/ncm2-path')
  " call minpac#add('ncm2/ncm2-tmux')
  " call minpac#add('wellle/tmux-complete')
  call minpac#add('ncm2/ncm2-cssomni')
  call minpac#add('ncm2/ncm2-ultisnips') " Experimental
  " call minpac#add('ncm2/ncm2-snipmate') " Experimental
  call minpac#add('ncm2/ncm2-html-subscope')
  call minpac#add('phpactor/ncm2-phpactor')
  call minpac#add('chrisbra/Colorizer')
  " Don't feel the need for it, but I keep the link in case
  " https://github.com/2072/PHP-Indenting-for-VIm

  call minpac#add('othree/csscomplete.vim')

  call minpac#add('garbas/vim-snipmate')
  call minpac#add('tomtom/tlib_vim')
  call minpac#add('marcweber/vim-addon-mw-utils')

  " call minpac#add('lvht/phpcd.vim', {'type': 'opt', 'do': '!composer install --no-dev -o'})
  " augroup loadphpcd
  "     autocmd!
  "     autocmd FileType php packadd phpcd.vim
  " augroup END

  " call minpac#add('majutsushi/tagbar', {'type': 'opt'})
  " call minpac#add('vim-php/tagbar-phpctags.vim', {'type': 'opt'})

  call minpac#add('SirVer/ultisnips')
  call minpac#add('honza/vim-snippets')
  call minpac#add('elythyr/pdv', {'branch': 'improvements'})
  call minpac#add('tobyS/vmustache')
  call minpac#add('alvan/vim-php-manual', {'for': 'php'})
  call minpac#add('sniphpets/sniphpets-common')
  call minpac#add('sniphpets/sniphpets-symfony')
  call minpac#add('sniphpets/sniphpets-phpunit')
  call minpac#add('sniphpets/sniphpets-doctrine')
  call minpac#add('sniphpets/sniphpets-postfix-codes')
  call minpac#add('sniphpets/sniphpets')

  call minpac#add('janko-m/vim-test')
  call minpac#add('benmills/vimux')
  call minpac#add('airblade/vim-rooter')
  " call minpac#add('xolox/vim-easytags')
  " call minpac#add('xolox/vim-misc')

  call minpac#add('airblade/vim-gitgutter')

  " call minpac#add('kana/vim-vspec', {'type': 'opt'})

  call minpac#add('scrooloose/nerdtree')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  " call minpac#add('elythyr/php.vim', {'branch': 'phpdoc-folding'})
  " call minpac#add('elythyr/phpcd.vim', {'type': 'opt'})
  " call minpac#add('elythyr/phpunit.vim')
  " call minpac#add('vim-scripts/AnsiEsc.vim')
  call minpac#add('elythyr/vim-php-refactoring-toolbox', {'branch': 'improvements'})
  " call minpac#add('elythyr/vim-snippets', {'branch': 'perso'})
  " call minpac#add('elythyr/vim-sync', {'branch': 'improvements'})
  call minpac#add('elythyr/vim-twig')
  call minpac#add('elythyr/vim-cleanfold')
  call minpac#add('elythyr/php-foldexpr.vim')
  " debut ck
  call minpac#add('ncm2/ncm2-tagprefix')
  call minpac#add('arnaud-lb/vim-php-namespace')
  " save session vim
  call minpac#add('tpope/vim-obsession')
  "fin ck
  call minpac#add('lumiliet/vim-twig')
  call minpac#add('git://github.com/majutsushi/tagbar')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
" }}}
" }}}

" Autoload all config files
for s:config_file in split(glob(s:my_vim_dir . '/config/*.vim'), "\n")
  execute 'source ' s:config_file
endfor

let g:is_transparent = 0
function! Toggle_transparent()
  if g:is_transparent == 0
    hi Normal guibg=NONE ctermbg=NONE
    let g:is_transparent = 1
  else
    set background=dark
    let g:is_tranparent = 0
  endif
endfunction

nnoremap <leader>b : call Toggle_transparent()<CR>

" Transparentcy Background 
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guifg=NONE guibg=NONE       
hi Folded guifg=NONE guibg=NONE
hi VertSplit guifg=#fb4934 guibg=NONE


highlight GitGutterAdd    guifg=#b8bb26 guibg=NONE ctermfg=2
highlight GitGutterChange guifg=#fe8019 guibg=NONE ctermfg=3 
highlight GitGutterDelete guifg=#cc241d guibg=NONE ctermfg=1 


" Abbreviations {{{
cnoreabbrev f   find
cnoreabbrev sf  sfind
cnoreabbrev vsf vertical sfind
cnoreabbrev tf  tabfind

cnoreabbrev te  tabedit
" }}}

unlet s:my_vim_dir

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
let s:HexColored = 0
let s:HexColors = []

" vim: ts=2 sw=2 et fdm=marker
