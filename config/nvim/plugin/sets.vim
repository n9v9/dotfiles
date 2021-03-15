set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set hidden
set autowrite

set splitright
set splitbelow

set number
set relativenumber

set guicursor=a:blinkon0

set nohlsearch
set incsearch

set noerrorbells
set nowrap

set undodir="~/.vim/undodir/"
set undofile
set noswapfile
set nobackup
set nowritebackup

set smartindent

set smartcase
set ignorecase

set colorcolumn=100
set textwidth=100
set signcolumn=yes

set updatetime=200
set shortmess+=c

" Change splits from horizontal to vertical.
noremap <leader>\| <c-w>t<c-w>H
" Change splits from vertical to horizontal.
noremap <leader>- <c-w>t<c-w>K

" Goto previous buffer.
noremap <leader>f :e #<CR>
