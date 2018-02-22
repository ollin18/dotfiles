if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/bundles')
  call dein#begin('$HOME/.config/nvim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('kassio/neoterm')
  call dein#add('nightsense/vim-crunchbang')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-surround')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('nightsense/vim-crunchbang')
  call dein#add('vitalk/vim-shebang')
  call dein#add('vim-latex/vim-latex')
  call dein#add('ivanov/vim-ipython')
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('JuliaEditorSupport/julia-vim')
  call dein#add('ajpaulson/julia-syntax.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('scrooloose/nerdtree')
  call dein#add('myusuf3/numbers.vim')
  call dein#add('bitc/vim-bad-whitespace')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('kassio/neoterm')
  call dein#add('chazmcgarvey/zencoding-vim')


  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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

" Map the ESC to a double tap of the ñ key
inoremap ññ <ESC>

filetype plugin indent on
set grepprg=grep\ -nH\ $*

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<S-Enter>'

map <C-m> :YcmCompleter GoTo<CR>
nmap <C-k> :YcmCompleter GetDoc<CR>
let g:airline_powerline_fonts = 1
let g:syntastic_check_on_open = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="base16"
syntax on
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=none
set autoread
set number
let g:rainbow_active = 1
set expandtab
set shiftwidth=4
set softtabstop=4
let t_Co = 256
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif



silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

let g:airline_powerline_fonts = 1
let g:ariline_powerline_theme='bubblegum'
set laststatus=2
set ttimeoutlen=50
colorscheme crunchbang

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

let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'

" Useful maps"
" open terminal
nnoremap <silent> ,to :call neoterm#open()<cr>
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

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
