let g:coc_global_extensions=[
\ 'coc-marketplace',
\ 'coc-json',
\ 'coc-emmet',
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-clangd',
\ 'coc-go',
\ 'coc-rust-analyzer',
\ 'coc-markdownlint',
\ 'coc-pairs',
\]

function! s:initCoc()
    nmap <silent> <leader>gd <Plug>(coc-definition)
    nmap <silent> <leader>gr <Plug>(coc-references)
    nmap <silent> <leader>rn <Plug>(coc-rename)

    nnoremap <silent> K :call <SID>show_documentation()<CR>
endfunction

" Use tab to trigger completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Trigger completion with ctrl+space.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Organize the imports in all go files.
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

autocmd FileType c,cpp,go,rust,javascript,typescript,html,css call s:initCoc()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
