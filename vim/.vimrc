" Use Vim defaults (much better!)
set nocompatible

" Turn on syntax highlighting for specific file types
" filetype on
syntax on

" Set hybrid line numbers
set number relativenumber

" Set color column at 80
set cc=80

" show command in bottom bar
set showcmd

" don't show the mode since we'll be using airline
set noshowmode

" highlight the current line
set cursorline

" searching settings

" while searching, show the matches
set incsearch

" highlight search results
set hlsearch

" set mapleader
let mapleader=" "

" turn off search highlight
noremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" make jk escape
inoremap jk <esc>

" allow backspacing over everything in INSERT mode
set backspace=indent,eol,start

" make each <Tab> worth 2 spaces
set tabstop=2 softtabstop=2

" the number of spaces used when indenting
set shiftwidth=2

" insert the correct number of spaces for a tab character in insert mode
set expandtab

" turn on indenting
set smartindent
set autoindent

set ignorecase
set smartcase

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set updatetime=100
set wildmenu

"Show trailing whitespace
highlight ExtraWhitespace ctermbg=Red guibg=Red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader><F2> :set list lcs+=space:. listchars+=tab:-><CR>

" Plug ins
"call plug#begin()
"
"Plug 'https://github.com/airblade/vim-gitgutter'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"call plug#end()

"let g:airline_theme='base16'

