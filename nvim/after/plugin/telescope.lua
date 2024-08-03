local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>O', builtin.find_files, {})
vim.keymap.set('n', '<leader>H', builtin.git_files, {})

