local builtin = require("telescope.builtin")

require("telescope").load_extension "file_browser"
require("telescope").setup {
    layout_config = {prompt_position = "top"},
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {}
        }
    }
}

telescope = require("telescope")

vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<leader>O", builtin.find_files, {})
vim.keymap.set("n", "<leader>o", ":Telescope git_files show_untracked=true<CR>")
vim.keymap.set(
    "n",
    "<leader>O",
    function()
        builtin.find_files({cwd = "/", hidden = true})
    end
)
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
vim.keymap.set("n", "<leader>H", builtin.git_status, {})
vim.keymap.set("n", "<leader>P", builtin.commands, {})
vim.keymap.set("n", "<leader>di", builtin.diagnostics, {})
vim.keymap.set(
    "n",
    "<leader>l",
    function()
        builtin.buffers({sort_mru = true})
    end
)
