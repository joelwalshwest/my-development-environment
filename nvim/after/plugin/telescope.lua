local builtin = require('telescope.builtin')

require("telescope").load_extension "file_browser"
require('telescope').setup {
   layout_config = { prompt_position = "top" },
   extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- ["i"] = {
        --   -- your custom insert mode mappings
        -- },
      },
    },
  },
}


vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<leader>O', builtin.find_files, {})
vim.keymap.set('n', '<leader>H', builtin.git_files, {})

