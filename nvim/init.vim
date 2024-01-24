" Neovim init file. Likely in ~/AppData/Local/nvim/init.vim
" you always forget that :noh turns off highlighting of the last search
let mapleader = " "
nnoremap <Leader>w <C-W>
" paste over things wihout overwriting the yank buffer
xnoremap <Leader>p "_dP
inoremap jk <Esc>
inoremap kj <Esc>
noremap <C-J> <C-E>
noremap <C-K> <C-Y>
set nu "you like line numbers. you always have
"set foldmethod=syntax "folding by default gets really annoying
set autoread "try to get nvim to notice changes made to the file in other programs
set lcs=tab:>_,multispace:!,leadmultispace:.,trail:!,extends:>,precedes:<,nbsp:+
"set list "kind of annoying to have on all the time
set fileformats=unix,dos
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
" vnoremap jk <Esc> "this is a dumb idea, it'll lead to getting pushed
" vnoremap kj <Esc> "out of vmode whenver there's some movement retrace
noremap j gj
noremap k gk
nnoremap <F11> :e $MYVIMRC<CR>
nnoremap <F12> :so $MYVIMRC<CR>
let g:C_Ctrl_j = 'off' "this is necessary due to some bash support thing
" these next two seem a little dubious and maybe a bad idea. good for obsidian.
"nnoremap 0 g0
"nnoremap $ g$
"set F6 to undelete the most recently deleted buffer
autocmd BufDelete * let g:latest_deleted_buffer = expand("<afile>:p")
noremap <F6> :split <C-R>=fnameescape(g:latest_deleted_buffer)<CR><CR>

"try to fix nvim external commands if bash4windows/gitbash-spawned nvim
"if &shell =~? 'sh\.exe'
	set shellcmdflag=-c
"endif

" MISCELLANEOUS GOODIES
" :verbose set tw? --> discover what autowrap lengths that faghag bram has set
" ----------------------------- GRAPHICAL MODE (NON-TERMINAL) STUFF---------------
" set go+=egimrT
" set lines=60
" set columns=100

colorscheme default
" -------------- Fonts ------------------
"set guifont=RobotoMono\ NFM:h12 "very round, crisp, clean, fat for it's height
set guifont=Iosevka\ NFM:h14:Medium "very tall and skinny, easy to read, clean.
"set guifont=FantasqueSansMono\ NFM:h14 "tall,skinny, curvy and whimsy, stupid 'l's and 'i's
"set guifont=Cascadia\ Code\ PL:h14 "nice font but edges are feathery
"set guifont=JetBrainsMono\ NFM:h14 "tall, clear, annoying 'l', very nice bold
"set guifont=Cousine\ NFM:h14 "medium in all regards, clear, readable
"set guifont=InconsolataGo\ NFM:h14 "the old classic, round and clear as always
"Plug 'yuezk/vim-js'

"use :PlugInstall while nvim is running to actually install
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
"Plug 'github/copilot.vim'
Plug 'relastle/bluewery.vim'
Plug 'rktjmp/lush.vim'
call plug#end()

if exists('g:neovide')
	colorscheme bluewery
	:cd ~
endif
