
" Make Vim more useful
set nocompatible
set binary

" Centralize backups, swapfiles
set backupdir=~/.vim/backups
set directory=~/.vim/backups
set noswapfile

" Change leader to a comma
let g:mapleader = ","

" Change the terminal's title
set title

" Always show statusline
set laststatus=2

" Set utf-8 encoding on write
set encoding=UTF-8

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
" Indents <Tab> as spaces
set expandtab
set autoindent
set number
set ai
set si

" Enable word wrap
set nowrap           " do not automatically wrap on load

" Case insensitive search
set ignorecase
" Smart case search if there is uppercase
set smartcase

" Show some whitespace chars
set listchars=tab:▸·,trail:·,extends:❯,precedes:❮,nbsp:×

" Highlight matching bracket
set showmatch

" Auto read when a file is changed from the outside
set autoread

" Turn on syntax highlighting
syntax on

" Blazing fast vim
set ttimeoutlen=0

" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch

" Mouse clicks
set mouse=i

" S for saving
noremap S :update<CR>

" Q for leaving
noremap Q :q<CR>

" Make exiting to normal mode a bit easier
imap <leader><leader> <Esc>

" filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" tabs
nnoremap <C-l> :tabnew<Space>
inoremap <C-l> <Esc>:tabnew<Space>
" control t + arrows to move
map <C-d><left> :tabp<cr>
map <C-d><right> :tabn<cr>

" copy selected text to clipboard
vmap <space>c :w !pbcopy<cr><cr>

" Plugins
call plug#begin('~/.vim/bundle')

Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord
