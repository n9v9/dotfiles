syntax on

let mapleader=' '

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

Plug 'simeji/winresizer'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

autocmd BufWritePre * :call TrimWhitespace()