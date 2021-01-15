" Create the .netrwhist file only in the users home directory, not in every
" directory where vim opens.
let g:netrw_home='~'

" Disable the arrow keys.
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" No more 'Not an editor command' errors :)
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
:command! Bd bd
