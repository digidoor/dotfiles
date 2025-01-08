vim.cmd([[
" Neovim init file. Likely in ~/AppData/Local/nvim/init.vim
" you always forget that :noh turns off highlighting of the last search
set nocompatible mouse=a wildmenu incsearch
let g:netrw_liststyle = 3
nnoremap <silent> <Space> <NOP>
let mapleader = " "
nnoremap <Leader>w <C-W>
nnoremap <Leader>f :Lex<CR>
nnoremap <Leader>l :set list!<CR>
nnoremap <Leader>h :nohl<CR>
nnoremap <F4> :e $MYVIMRC<CR>
nnoremap <F8> :so $MYVIMRC<CR>
" paste over things wihout overwriting the yank buffer
xnoremap <Leader>p "_dP
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
let g:C_Ctrl_j = 'off' "necessary for ^J remap to work; some compat thing
noremap <C-J> <C-E>
noremap <C-K> <C-Y>
inoremap jk <Esc>
inoremap kj <Esc>
noremap j gj
noremap k gk

"set F6 to undelete the most recently deleted buffer
autocmd BufDelete * let g:latest_deleted_buffer = expand("<afile>:p")
noremap <F6> :split <C-R>=fnameescape(g:latest_deleted_buffer)<CR><CR>

set showcmd "show keys pressed so far in the lower right mid-command
set number "you like line numbers. you always have "nu for short
set ruler "row and column indicator in the bottom right "ru for short
set backspace=indent,eol,start "can backspace over most things "bs for short
set autoread "autoreload any changes to the file "ar for short
set lcs=tab:<->,multispace:!,leadmultispace:.,trail:_,extends:>,precedes:<,nbsp:+,eol:⏎
set noexpandtab copyindent preserveindent smartindent 
set softtabstop=0 shiftwidth=4 tabstop=4
set linebreak "try not to break in the middle of words
set showbreak=… "in Insert, press Ctrl+K then ',' then '.' for …
set visualbell splitbelow splitright
"set foldmethod=syntax "folding by default gets really annoying
"set list "show a variety of whitespace characters
"set dg " allow the input of digraphs by char<BS>char
"set background=dark
"set undodir=~/.vim/undodir "default location is better in .cache
"set undofile "use an undo file; serious pros and cons

"try to fix nvim external commands it bash4windows/gitbash-spawned nvim
"if &shell =~? 'sh\.exe'
"	set shellcmdflag=-c
"endif

"creates a command to diff the saved file with the modified buffer; very useful
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
	\ | wincmd p | diffthis
"^ if the first nonwsp char is '\', treat it as a continuation of the prv line
nnoremap <Leader>d <Cmd>DiffOrig<CR>

" MISCELLANEOUS GOODIES
" :verbose set tw? --> discover what autowrap lengths that faghag bram has set
" ------------ GRAPHICAL MODE (NON-TERMINAL) STUFF---------------
" set go+=egimrT
" set lines=60
" set columns=100

"colorscheme default
" -------------- Fonts ------------------
"set guifont=RobotoMono\ NFM:h12 "very round, crisp, clean, fat for it's height
set guifont=Iosevka\ NFM:h14:Medium "very tall and skinny, easy to read, clean.
"set guifont=FantasqueSansMono\ NFM:h14 "tall,skinny, curvy and whimsy, stupid 'l's and 'i's
"set guifont=Cascadia\ Code\ PL:h14 "nice font but edges are feathery
"set guifont=JetBrainsMono\ NFM:h14 "tall, clear, annoying 'l', very nice bold
"set guifont=Cousine\ NFM:h14 "medium in all regards, clear, readable
"set guifont=InconsolataGo\ NFM:h14 "the old classic, round and clear as always
"Plug 'yuezk/vim-js'

" use :PlugInstall while nvim is running to actually install
"call plug#begin()
"	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"	Plug 'vim-airline/vim-airline'
"	Plug 'vim-airline/vim-airline-themes'
"	Plug 'pangloss/vim-javascript'
"	"Plug 'github/copilot.vim'
"	Plug 'relastle/bluewery.vim'
"	Plug 'rktjmp/lush.vim'
"call plug#end()

if exists('g:neovide')
"	colorscheme bluewery
	:cd ~
endif

" Syntax coloring on when possible
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

set sessionoptions+=options "for saving sessions
set fileformats=unix,dos " prefer unix line endings
]])

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("v", "<Leader>x", ":lua<CR>")
print("This is only a test.")
require("config.lazy")
