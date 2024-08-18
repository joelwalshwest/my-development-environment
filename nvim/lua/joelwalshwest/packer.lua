-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- doorboy
        use "itmammoth/doorboy.vim"

        -- marks
        use(
            {
                "chentoast/marks.nvim",
                config = function()
                    require "marks".setup(
                        {
                            default_mappings = false,
                            mappings = {
                                delete_line = "md"
                            }
                        }
                    )
                end
            }
        )

        -- fzf
        use {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            requires = {"nvim-tree/nvim-web-devicons"}
            -- or if using mini.icons/mini.nvim
            -- requires = { "echasnovski/mini.icons" }
        }

        -- neotree
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim"
            }
        }

        -- bufkill
        use "qpkorr/vim-bufkill"

        -- formatting
        use(
            {
                "Pocco81/auto-save.nvim",
                config = function()
                    require("auto-save").setup {
                        trigger_events = {"BufLeave", "FocusLost"}, -- vim events that trigger auto-save. See :h events
                        enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
                        execution_message = {
                            message = function()
                                -- message to print on save
                                return ""
                            end,
                            dim = 0.18, -- dim the color of `message`
                            cleaning_interval = 1250 -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
                        }
                    }
                end
            }
        )
        use {"mhartington/formatter.nvim"}

        -- terminal
        use "voldikss/vim-floaterm"

        -- packer
        use "wbthomason/packer.nvim"

        -- telescope.nvim
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            -- or                            , branch = '0.1.x',
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
        }

        -- catppuccin
        use(
            {
                "catppuccin/nvim",
                as = "catppuccin",
                config = function()
                    vim.cmd("colorscheme catppuccin")
                end
            }
        )

        -- tresitter
        use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

        -- harpoon
        use("theprimeagen/harpoon")

        -- undotree
        use("mbbill/undotree")

        -- lualine
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons", opt = true}
        }

        -- gitsigns
        use("lewis6991/gitsigns.nvim")

        -- lsp
        use("VonHeikemen/lsp-zero.nvim")
        use("neovim/nvim-lspconfig")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/nvim-cmp")

        -- debug
        use("mfussenegger/nvim-dap")
        use("mfussenegger/nvim-dap-python")
        use(
            {
                "rcarriga/nvim-dap-ui",
                requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
            }
        )
        use("HiPhish/debugpy.nvim")
        use("leoluz/nvim-dap-go")

        -- neotest
        use {
            "nvim-neotest/neotest",
            requires = {
                "nvim-neotest/nvim-nio",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "nvim-neotest/neotest-python",
                "fredrikaverpil/neotest-golang"
            }
        }

        use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"}
    end
)
