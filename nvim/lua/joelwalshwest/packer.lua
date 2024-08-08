-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
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
        use "numToStr/FTerm.nvim"
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
        use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

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
                requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
                config = function()
                    local dap = require("dap")
                    local dapui = require("dapui")
                    dapui.setup()
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                    end
                    dap.listeners.before.event_initialized["dapui_config"] = function()
                        dapui.close()
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                        dapui.close()
                    end
                end
            }
        )
        use("HiPhish/debugpy.nvim")

        -- neotest
        use {
            "nvim-neotest/neotest",
            requires = {
                "nvim-neotest/nvim-nio",
                "nvim-neotest/neotest-python",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter"
            }
        }
    end
)
