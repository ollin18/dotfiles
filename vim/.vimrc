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

set number
set relativenumber

" This one is to avoid cursor problems on a ssh connection
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
" ============================================================================
" Plugins (administrated by Vundle) {{{1
" ============================================================================

" Required:
set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/VundleVim.vim

call vundle#begin('$HOME/.config/nvim/bundles')

    Plugin 'VundleVim/Vundle.vim'

    " Nerdtree
    Plugin 'preservim/nerdtree'

    " Autocomplete
    Plugin 'Shougo/neosnippet.vim'
    Plugin 'Shougo/neosnippet-snippets'
    Plugin 'tpope/vim-speeddating'
    Plugin 'github/copilot.vim'

    " Terminal or IDE
    Plugin 'kassio/neoterm'

    " UI Layout
    " Plugin 'nightsense/vim-crunchbang'
    Plugin 'dracula/vim'
    Plugin 'jdsimcoe/abstract.vim'
    Plugin 'ryanoasis/vim-devicons'

    " CSV
    Plugin 'chrisbra/csv.vim'

    " Powerline
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    " Writting
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'sbdchd/vim-shebang'
    Plugin 'bitc/vim-bad-whitespace'
    Plugin 'Yggdroot/indentLine'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'mattn/emmet-vim'

    " Folding
    Plugin 'tmhedberg/SimpylFold'

call vundle#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.

" ============================================================================
" Basic settings and maps {{{1
" ============================================================================

" Time in milliseconds that is waited for a key code or mapped key sequence to
" complete.
set ttimeoutlen=50

" Map the ESC to a double tap of the ñ key
inoremap ññ <ESC>
inoremap fd <ESC>
inoremap jf <ESC>

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

" Don't let terminal override my vim settings
" set notermguicolors
let t_Co = 256
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
set encoding=utf8
set guifont=IBM\ Plex\ Mono:h14
" set guifont=Noto\ Mono\ for\ Powerline:h14
" colorscheme crunchbang
colorscheme dracula

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

au BufNewFile,BufRead *.sh
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
            \ :ShebangInsert bash

au BufNewFile,BufRead *.R
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

" ============================================================================
" Shebang {{{1
" ============================================================================

" Define my common Shebang
let g:shebang#shebangs = {
            \ 'julia': '#!/usr/bin/env julia',
            \ 'sh': '#!/usr/bin/env bash',
            \ 'python': '#!/usr/bin/env python',
            \ 'R': '#!/usr/bin/env Rscript'
            \}

" ============================================================================
" Folding {{{1
" ============================================================================

let g:SimpylFold_docstring_preview=1

" ============================================================================
" Buffers {{{1
" ============================================================================

command! -nargs=+ Bs :vert sbuffer <args>

" Commands to deal with the buffers without going all the way through the
" colon
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>ls :ls<CR>
nnoremap <silent> <leader>bs1 :Bs 1<CR>
nnoremap <silent> <leader>bs2 :Bs 2<CR>
nnoremap <silent> <leader>bs3 :Bs 3<CR>
nnoremap <silent> <leader>bs4 :Bs 4<CR>
nnoremap <silent> <leader>bs5 :Bs 5<CR>


" ============================================================================
" Calendar {{{1
" ============================================================================

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ============================================================================
" CSV {{{1
" ============================================================================

let b:csv_arrange_align = 'l*'

" ============================================================================
" Numbers {{{1
" ============================================================================

nnoremap <silent> <leader>nt :NumbersToggle<CR>
nnoremap <silent> <leader>no :NumbersOnOff<CR>

" ============================================================================
" Markdown {{{1
" ============================================================================

let vim_markdown_preview_hotkey='<C-m>'
" let vim_markdown_preview_browser='firefox'
let vim_markdown_preview_pandoc=1

" ============================================================================
" Jupyter Notebooks {{{1
" ============================================================================

autocmd Filetype ipynb nmap <silent><Leader>bb :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
let g:vimpyter_color = 1
