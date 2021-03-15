let g:go_doc_keywordprg_enabled=0
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_def_mapping_enabled=0
let g:go_fmt_command="goimports"

autocmd FileType go nmap <leader>got <Plug>(go-test)
autocmd FileType go nmap <leader>gob <Plug>(go-build)
autocmd FileType go nmap <leader>gor <Plug>(go-run)
