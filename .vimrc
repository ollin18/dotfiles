" vim: fdm=marker
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
" ============================================================================
" Neovim default {{{1
" ============================================================================

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

" This one is to avoid cursor problems on a ssh connection
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
" ============================================================================
" Plugins (administrated by dein) {{{1
" ============================================================================

" Required:
set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/bundles')
    call dein#begin('$HOME/.config/nvim/bundles')

    " In order to let dein manage itself we have to add the local dir of the
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
    call dein#add('sbdchd/vim-shebang')
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

" Time in milliseconds that is waited for a key code or mapped key sequence to
" complete.
set ttimeoutlen=50

" Map the ESC to a double tap of the ñ key
inoremap ññ <ESC>

" Setting up leader key
let mapleader = ","

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
set laststatus=2

" ============================================================================
" UI Layout {{{1
" ============================================================================
let t_Co = 256
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
set encoding=utf8
set guifont=IBM\ Plex\ Mono:h14
colorscheme crunchbang

" ============================================================================
" NERDTree {{{1
" ============================================================================
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" ============================================================================
" Folding {{{1
" ============================================================================
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" ============================================================================
" Surround {{{1
" ============================================================================
" Easier surrounding
map ss ysiw

" ============================================================================
" Autocommands {{{1
" ============================================================================

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.jl
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

" ============================================================================
" Terminal {{{1
" ============================================================================

" Where should the terminal open
let g:neoterm_default_mod = ':vertical'
let g:neoterm_keep_term_open = 1

" Commands to deal with the terminal
nnoremap <silent> <leader>to :Topen<CR>
nnoremap <silent> <leader>tc :Tclose<CR>
nnoremap <silent> <leader>tt :Ttoggle<CR>
nnoremap <silent> <leader>tk :Tkill<CR>
nnoremap <silent> <leader>tl :Tclear<CR>
nnoremap <silent> <leader>ts :T %:p<CR>
nnoremap <silent> <leader>tp :T python %:p<CR>
nnoremap <silent> <leader>tj :T julia<CR>

" Easily change from insert to normal mode on a terminal
tnoremap <Esc> <C-\><C-n>

" Neoterm mappings
silent! nmap <C-l> :TREPLSendLine<CR>
silent! vmap <C-s> :TREPLSendSelection<CR>

" ============================================================================
" Fugitive (GIT) {{{1
" ============================================================================

" Git commands
command! -nargs=+ Tg :T git <args>

" ============================================================================
" LaTeX {{{1
" ============================================================================

let g:tex_flavor = "pdflatex"
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'

" ============================================================================
" NERDcommenter {{{1
" ============================================================================

" Add a space between comment delimiter and comment
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
