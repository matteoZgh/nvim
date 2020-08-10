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

set foldmethod=indent
set foldlevel=99
set foldenable

" set termguicolors

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

vnoremap <C-y> "+y
noremap <C-p> "+p

noremap <LEADER><CR> :nohlsearch<CR>

func! Tab()
	return pumvisible() ? "\<C-n>" : "\<TAB>"
endfunc
inoremap <expr> <TAB> Tab()

noremap <silent> <C-j> :call Comment()<CR>
noremap <silent> <C-k> :call Uncomment()<CR>


" ======
" plugin
" ======

call plug#begin('~/.config/nvim/plugged') 

" Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'matteoZgh/vim-comment'

call plug#end()
 
let g:coc_global_extensions = [
		\		'coc-clangd', 
		\		'coc-python',
		\		'coc-json', 
		\		'coc-tsserver'
		\	]


" ======
" themes
" ======

func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    highlight NonText guibg=None ctermbg=None
endfunc
autocmd ColorScheme * call s:transparent_background()

" colorscheme gruvbox


" =========
" coderuner
" =========

noremap <F5> :call CompileRunCode()<CR>
func! CompileRunCode()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		exec "!gcc % -o %<"
		:sp
		:res -15
		:set nonumber
		:set norelativenumber
		:term ./%<
		:noremap <buffer> q :q<CR>
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -o %<"
		:sp
		:res -15
		:set nonumber
		:set norelativenumber
		:term ./%<
		:noremap <buffer> q :q<CR>
	elseif &filetype == 'java'
		set splitbelow
		exec "!javac %"
		:sp
		:res -15
		:set nonumber
		:set norelativenumber
		:term java %<
		:noremap <buffer> q :q<CR>
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:res -15
		:set nonumber
		:set norelativenumber
		:term python3 %
		:noremap <buffer> q :q<CR>
	endif
endfunc
