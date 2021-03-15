lua << EOF
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-h>"] = actions.file_split,
                ["<C-p>"] = false,
                ["<C-n>"] = false,
                ["<C-t>"] = false,
                ["<C-c>"] = false,
                ["<C-x>"] = false,
            },
        }
    },
}

require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep> ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>rc :lua require('telescope.builtin').find_files({prompt_title = "Dotfiles", cwd = "~/.dotfiles"})<CR>
