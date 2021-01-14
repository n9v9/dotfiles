let g:clang_format#style_options={
\ "AccessModifierOffset": -4,
\}

autocmd BufWritePre *.c,*.h,*.cpp,*.hpp :ClangFormat
