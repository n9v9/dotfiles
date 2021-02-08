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
\]

let g:coc_fzf_preview=''
let g:coc_fzf_opts=[]

function! s:initCoc()
    " ALE is only used for non coc things, atm only C# with OmniSharp.
    let g:ale_enabled=0

    nmap <silent> <leader>gd <Plug>(coc-definition)
    nmap <silent> <leader>gr <Plug>(coc-references)
    nmap <silent> <leader>rn <Plug>(coc-rename)

    nnoremap <silent> K :call <SID>show_documentation()<CR>
endfunction

function! s:initOmniSharp()
    " ALE is only used for C#.
    let g:ale_enabled=1
    let g:ale_linters={
    \ 'cs': ['OmniSharp']
    \}
    let g:ale_sign_error='✘'
    let g:ale_sign_warning='⚠'

    let g:OmniSharp_selector_ui='fzf'
    let g:OmniSharp_want_snippet=1 "Enable UltiSnips.

    nmap <silent> <leader>gd :OmniSharpGotoDefinition<CR>
    nmap <silent> <leader>gr :OmniSharpFindUsages<CR>
    nmap <silent> <leader>rn :OmniSharpRename<CR>

    nmap <silent> <leader>fi :OmniSharpFindImplementations<CR>
    nmap <silent> <leader>ft :OmniSharpFindType<CR>
    nmap <silent> <leader>fs :OmniSharpFindSymbol<CR>
    nmap <silent> <leader>fm :OmniSharpFindMembers<CR>

    nmap <silent> <leader>fx :OmniSharpFixUsings<CR>
    nmap <silent> <leader>ca :OmniSharpGetCodeActions<CR>

    nnoremap <silent> K :OmniSharpDocumentation<CR>
endfunction

" Disable TAB because coc takes care of it.
" https://github.com/SirVer/ultisnips/issues/633
let g:UltiSnipsExpandTrigger='<NUL>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-j>'

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

autocmd FileType cs call s:initOmniSharp()
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
