syntax on

let mapleader=' '

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}

Plug 'dense-analysis/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'sirver/UltiSnips'

Plug 'rhysd/vim-clang-format'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'

Plug 'simeji/winresizer'
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

autocmd BufWritePre * :call TrimWhitespace()
