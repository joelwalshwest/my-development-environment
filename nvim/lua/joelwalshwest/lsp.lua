local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    -- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

lsp_zero.extend_lspconfig(
    {
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities()
    }
)

local function organize_ts_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local function organize_py_imports()
    local params = {
        command = "pyright.organizeimports",
        arguments = {vim.uri_from_bufnr(0)}
    }
    vim.lsp.buf.execute_command(params)
end

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require "lspconfig".pyright.setup {
    PyrightOrganizeImports = {
        organize_imports,
        description = "Organize Imports"
    }
}
require "lspconfig".ts_ls.setup {
    commands = {
        OrganizeImports = {
            organize_ts_imports,
            description = "Organize TS Imports"
        }
    }
}
require "lspconfig".tailwindcss.setup({})

require "lspconfig".gopls.setup {
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
    gopls = {
        complete_unimported = true,
        usePlaceholders = true
    }
}

---
-- Autocompletion setup
---
local cmp = require("cmp")

cmp.setup(
    {
        sources = {
            {name = "nvim_lsp"}
        },
        snippet = {
            expand = function(args)
                -- You need Neovim v0.10 to use vim.snippet
                vim.snippet.expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<ESC>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }
        )
    }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require("lspconfig")[ls].setup(
--         {
--             capabilities = capabilities
--             -- you can add other fields for setting up lsp server in this table
--         }
--     )
-- end
