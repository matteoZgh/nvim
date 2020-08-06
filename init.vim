"  __  __         _   _ _____ _____     _____ __  __
" |  \/  |_   _  | \ | | ____/ _ \ \   / /_ _|  \/  |
" | |\/| | | | | |  \| |  _|| | | \ \ / / | || |\/| |
" | |  | | |_| | | |\  | |__| |_| |\ V /  | || |  | |
" |_|  |_|\__, | |_| \_|_____\___/  \_/  |___|_|  |_|
"         |___/
" 

syntax on

set number
set relativenumber

set wrap

set showcmd

set wildmenu

set cursorline

set hlsearch
set incsearch

set encoding=utf-8

set scrolloff=2

exec "nohlsearch"

func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    highlight NonText guibg=None ctermbg=None
endf
autocmd ColorScheme * call s:transparent_background()

let g:coc_global_extensions = ['coc-clangd']

call plug#begin('~/.config/nvim/plugged') 

Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
 
colorscheme gruvbox
