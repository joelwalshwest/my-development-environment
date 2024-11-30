-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`packer
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- tailwind-sorter
        use {
            "laytan/tailwind-sorter.nvim",
            requires = {"nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim"},
            config = function()
                require("tailwind-sorter").setup(
                  {
                    on_save_enabled = true, 
                    on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' }, -- The file patterns to watch and sort.
                    trim_spaces = true,
                  }
                )
            end,
            run = "cd formatter && npm ci && npm run build"
        }

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
        use(
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate"
            }
        )

        -- harpoon
        use("theprimeagen/harpoon")

        -- undotree
        use("mbbill/undotree")

        -- lualine
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "nvim-tree/nvim-web-devicons",
                opt = true
            }
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

        -- autotag
        use("windwp/nvim-ts-autotag")

        -- neotest
        use {
            "nvim-neotest/neotest",
            requires = {
                "marilari88/neotest-vitest",
                "nvim-neotest/nvim-nio",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "nvim-neotest/neotest-python",
                "fredrikaverpil/neotest-golang"
            }
        }

        use {
            "kevinhwang91/nvim-ufo",
            requires = "kevinhwang91/promise-async"
        }

        -- ChatGPT
        use(
            {
                "jackMort/ChatGPT.nvim",
                config = function()
                    require("chatgpt").setup(
                        {
                            keymaps = {
                                submit = "<C-8>"
                            }
                        }
                    )
                end,
                requires = {
                    "MunifTanjim/nui.nvim",
                    "nvim-lua/plenary.nvim",
                    "folke/trouble.nvim",
                    "nvim-telescope/telescope.nvim"
                }
            }
        )

        -- codecompanioin
        use(
            {
                "olimorris/codecompanion.nvim",
                requires = {
                    "nvim-lua/plenary.nvim",
                    "nvim-treesitter/nvim-treesitter",
                    "nvim-telescope/telescope.nvim", -- For using slash commands
                    {"MeanderingProgrammer/render-markdown.nvim", ft = {"markdown", "codecompanion"}}
                },
                config = function()
                    require("codecompanion").setup(
                        {
                            adapters = {
                                openai = function()
                                    return require("codecompanion.adapters").extend(
                                        "openai",
                                        {
                                            env = {
                                                api_key = "OPENAI_API_KEY"
                                            }
                                        }
                                    )
                                end
                            },
                            display = {
                                chat = {
                                    render_headers = false
                                }
                            },
                            strategies = {
                                chat = {
                                    adapter = "openai"
                                },
                                inline = {
                                    adapter = "openai"
                                }
                            }
                        }
                    )
                end
            }
        )
    end
)
