" +-----------------------------------------------------+
" |  __  __         _   _ _____ _____     _____ __  __  |
" | |  \/  |_   _  | \ | | ____/ _ \ \   / /_ _|  \/  | |
" | | |\/| | | | | |  \| |  _|| | | \ \ / / | || |\/| | |
" | | |  | | |_| | | |\  | |__| |_| |\ V /  | || |  | | |
" | |_|  |_|\__, | |_| \_|_____\___/  \_/  |___|_|  |_| |
" |         |___/                                       |
" |                                                     |
" +-----------------------------------------------------+


" ==========
" global set
" ==========

syntax on

set number
set relativenumber

set wrap

set showcmd

set wildmenu

set cursorline

set hlsearch
set incsearch

set encoding=UTF-8

set scrolloff=2

set ts=4
set sw=4

exec "nohlsearch"


" ======
" keymap
" ======

noremap <C-n> :NERDTreeToggle<CR>

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i


" ======
" plugin
" ======

call plug#begin('~/.config/nvim/plugged') 

" Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

call plug#end()
 
let g:coc_global_extensions = [
		\		'coc-clangd', 
		\		'coc-json', 
		\		'coc-tsserver'
		\	]


" ======
" themes
" ======

func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    highlight NonText guibg=None ctermbg=None
endf
autocmd ColorScheme * call s:transparent_background()

" colorscheme gruvbox


" =========
" coderuner
" =========

noremap <F5> :call CompileRunCode()<CR>
func! CompileRunCode()
	exec "w"
	if &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -o %<"
		:sp
		:res -15
		:set nonumber
		:set norelativenumber
		:term ./%<
	endif
endfunc

