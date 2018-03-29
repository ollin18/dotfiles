" vim: set fdm=marker: " Treat comments as folds
"
" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"  ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
" ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
"  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
"
" Author: Ollin Demian <ollin.demian@gmail.com>
"
"
" ============================================================================
" Neovim default {{{1
" ============================================================================

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" ============================================================================
" Plugins (administrated by dein) {{{1
" ============================================================================

" Required:
set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/bundles')
  call dein#begin('$HOME/.config/nvim/bundles')

  " In order to let deing manage itself we have to add the local dir of the
  " repo
  " Required:
  call dein#add('$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  " Autocomplete
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Terminal or IDE
  call dein#add('kassio/neoterm')

  " UI Layout
  call dein#add('nightsense/vim-crunchbang')
  call dein#add('jdsimcoe/abstract.vim')
  call dein#add('ryanoasis/vim-devicons')

  " Powerline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Writting
  call dein#add('tpope/vim-surround')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('vitalk/vim-shebang')
  call dein#add('bitc/vim-bad-whitespace')
  call dein#add('Yggdroot/indentLine')
  call dein#add('easymotion/vim-easymotion')

  " Syntax
  call dein#add('vim-latex/vim-latex')
  call dein#add('ivanov/vim-ipython')
  call dein#add('JuliaEditorSupport/julia-vim')
  call dein#add('ajpaulson/julia-syntax.vim')

  " Navigation
  call dein#add('scrooloose/nerdtree')
  call dein#add('myusuf3/numbers.vim')

  " Folding
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('tpope/vim-fugitive')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('kassio/neoterm')
  call dein#add('chazmcgarvey/zencoding-vim')
  call dein#add('FredKSchott/CoVim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" ============================================================================
" Basic settings and maps {{{1
" ============================================================================

" Map the ESC to a double tap of the ñ key
inoremap ññ <ESC>

" Check file type by extention and use indentation rule if have it
filetype plugin indent on
" set grepprg=grep\ -nH\ $*

" Set basic defaults
syntax on
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=none
set autoread
set number
let g:rainbow_active = 1
set expandtab
set shiftwidth=4
set softtabstop=4

" ============================================================================
" Powerline {{{1
" ============================================================================
let g:airline_powerline_fonts = 1
let g:syntastic_check_on_open = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="base16"
let g:airline_powerline_fonts = 1
let g:ariline_powerline_theme='bubblegum'

" ============================================================================
" UI Layout {{{1
" ============================================================================
let t_Co = 256
if (has("termguicolors"))
  set termguicolors
endif
set background=dark

" ============================================================================
" NERDTree {{{1
" ============================================================================
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

set laststatus=2
set ttimeoutlen=50
colorscheme crunchbang
"colorscheme abstract-theme

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Easier surrounding
map ss ysiw

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:neoterm_default_mod = 'vertical'
let g:neoterm_automap_keys = ',tt'

" Useful maps"
" open terminal
"let g:neoterm_default_mod = 'belowright'
" neoterm
let g:neoterm_default_mod = ':vertical'

let g:neoterm_keep_term_open = 0
nnoremap <silent> ,to :Topen<CR>
nnoremap <silent> ,tc :Tclose<CR>
nnoremap <silent> ,tk :call neoterm#kill()<CR>
nnoremap <silent> ,tl :call neoterm#clear()<CR>
nnoremap <silent> ,ts :T %:p<CR>
nnoremap <silent> ,tp :T python %:p<CR>

"nnoremap <silent> ,to :call neoterm#open()<cr>
" hide/close terminal
"nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
"nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
"nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

silent! nmap <C-l> :TREPLSendLine<CR>
silent! vmap <C-s> :TREPLSendSelection<CR>

let g:tex_flavor = "lualatex"
let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0

tnoremap <Esc> <C-\><C-n>

let g:NERDSpaceDelims = 1
