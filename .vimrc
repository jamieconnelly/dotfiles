" Make Vim more useful
set nocompatible
set binary
" Centralize backups, swapfiles
"set backupdir=~/.vim/tmp
"set directory=~/.vim/tmp
set noswapfile
" Change leader to a comma
let g:mapleader = ","
" Change the terminal's title
set title
" Show ruler
set ruler
" Always show statusline
set laststatus=2
" Fix colours in tmux
set t_Co=256
" Set utf-8 encoding on write
set encoding=UTF-8
set backspace=indent,eol,start
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
" Highlight current line
set cursorline
" Enable word wrap
set nowrap           " do not automatically wrap on load
" Case insensitive search
set ignorecase
" Smart case search if there is uppercase
set smartcase
set showcmd
" Disable beep and flashing
set vb t_vb=
" Enable listchars
set list
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
" Optimize for fast terminal connections
set ttyfast
" Mouse clicks
set mouse=i
" no matter your colorscheme, you'll have a vertical bar when you split.
set fillchars+=vert:\  "comment here to preserve the whitespace
"hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#555552 guibg=#555552 gui=NONE
"type R, then type what you're looking for, move right, and type what to replace it with
nnoremap <leader>r :%s///g<LEFT><LEFT><LEFT>
" ft to remove tabs
nnoremap ft :silent %s/\t/  /g
" standard = gs => get standard
nnoremap gs :silent %!standard --stdin --fix
" S for saving
noremap S :update<CR>
" Q for leaving
noremap Q :q<CR>
" Make exiting to normal mode a bit easier
imap <leader><leader> <Esc>
" reload vimrc
nmap <leader>rc :source ~/.vimrc<CR>
" omnifunc
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" highlight long lines
match ErrorMsg '\%>120v.\+'
" highlight trailing whitespace
match ErrorMsg '\s\+$'
" open new files right and below
set splitbelow
set splitright
" tabs
nnoremap <C-l> :tabnew<Space>
inoremap <C-l> <Esc>:tabnew<Space>
" control t + arrows to move
map <C-d><left> :tabp<cr>
map <C-d><right> :tabn<cr>
" copy selected text to clipboard
vmap <space>c :w !pbcopy<cr><cr>
" duplicate line
noremap <space>d yyp
" find word
noremap <space>f *N
" noh
nnoremap \ :noh<return>
" replace current word
noremap <space>r :%s/\<<C-r><C-w>\>//g<left><left>
" Plugins
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_powerline_fonts = 1
let g:airline_theme='bluewery'

Plug 'scrooloose/nerdtree'
  " nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  map <C-t> :NERDTreeToggle<CR>
  " Focus on NERDTree with the currently opened file with M
  noremap <silent> M :NERDTreeFind<CR>
  " hides "Press ? for help"
  let NERDTreeMinimalUI=1
  " shows invisibles
  let g:NERDTreeShowHidden=1
  " hide these files
  let NERDTreeIgnore = ['\.DS_Store$']
  " https://www.reddit.com/r/vim/comments/a4yzyt/g_characters_prefixing_directory_and_file_names/
  let g:NERDTreeNodeDelimiter = "\u00a0"

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'terryma/vim-multiple-cursors'

Plug 'ctrlpvim/ctrlp.vim'
  " ctrlp
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  let g:ctrlp_user_command = 'find %s -type f'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

Plug 'scrooloose/nerdcommenter'
  " mappings
  " https://github.com/scrooloose/nerdcommenter#default-mappings

Plug 'dense-analysis/ale'
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['prettier'],
  \   'typescript': ['prettier'],
  \   'python': ['black', 'isort']
  \}
  let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'typescript': ['tsserver', 'tslint'],
  \ 'typescript.tsx': ['tsserver', 'tslint'],
  \ 'javascript': ['eslint'],
  \ 'javascript.jsx': ['eslint'],
  \}
  highlight ALEError ctermbg=none cterm=underline
  highlight ALEWarning ctermbg=none cterm=underline

Plug 'vim-python/python-syntax'
  let g:python_highlight_all = 1

Plug 'ervandew/supertab'
Plug 'gabrielelana/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'inside/vim-search-pulse'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/rainbow_parentheses.vim'

"Plug 'mhartington/oceanic-next'
"  let g:colors_name="OceanicNext"
"  let g:airline_theme='oceanicnext'

Plug 'jacoborus/tender.vim'
Plug 'relastle/bluewery.vim'
Plug 'arcticicestudio/nord-vim'

" local
let $LOCALFILE=expand("~/.vimrc.local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif

call plug#end()

"colorscheme OceanicNext
" colorscheme nord
"let g:nord_uniform_status_lines = 0
"let g:nord_italic = 1
"let g:nord_italic_comments = 1
"let g:nord_comment_brightness = 12
colorscheme bluewery
hi CursorLine cterm=none
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
