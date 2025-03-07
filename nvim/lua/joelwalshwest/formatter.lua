-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        css = {
            require("formatter.filetypes.css").stylefmt
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier
        },
        json = {
            require("formatter.filetypes.json").jq
        },
        python = {
            require("formatter.filetypes.python").black
        },
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").luafmt

            -- You can also define your own configuration
        },
        go = {
            require("formatter.filetypes.go").gofmt
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.keymap.set("n", "<leader>F", ":FormatWriteLock<CR>")
vim.keymap.set(
    "n",
    "<leader>I",
    function()
        local ft = vim.bo.filetype
        if ft == "typescript" or ft == "typescriptreact" then
            vim.cmd("OrganizeImports")
        end
        if ft == "python" then
            vim.cmd("PyrightOrganizeImports")
        end
    end
)

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        group = vim.api.nvim_create_augroup("__formatter__", {clear = true}),
        callback = function()
            vim.cmd("FormatWriteLock")

            local ft = vim.bo.filetype

            if ft == "typescript" or ft == "typescriptreact" then
                vim.cmd("OrganizeImports")
            end
            if ft == "python" then
                vim.cmd("PyrightOrganizeImports")
            end
        end
    }
)
