require("neo-tree").setup(
    {
        filesystem = {
            follow_current_file = {
                enabled = true, -- This will find and focus the file in the active buffer every time
                --               -- the current file is changed while the tree is open.
                leave_dirs_open = false -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            }
        },
        window = {
            position = "left",
            mapping_options = {
                noremap = true,
                nowait = true
            },
            mappings = {
                ["<space>"] = {
                    "toggle_node",
                    nowait = false -- disable `nowait` if you have existing combos starting with this char that you want to use
                },
                ["S"] = "open_vsplit",
                ["s"] = ""
            }
        }
    }
)

vim.keymap.set("n", "<leader>E", ":Neotree reveal<CR>")
