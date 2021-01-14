function Setup()
    set signcolumn=no
    set colorcolumn=80
    set textwidth=80
endfunction

autocmd FileType markdown,tex,text :call Setup()
