set background=dark
colorscheme base16-atelier-dune

function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' ')
endfunction

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'StatusDiagnostic'
\ },
\}

" Use auocmd to force lightline update.
autocmd User CocDiagnosticChange call lightline#update()
