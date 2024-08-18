vim.cmd("set cdpath+=/")

_G.fzf_dirs = function(opts)
    local fzf_lua = require "fzf-lua"
    opts = opts or {}
    opts.prompt = "cd "
    -- opts.fn_transform = function(x)
    --     return fzf_lua.utils.ansi_codes.magenta(x)
    -- end
    opts.actions = {
        ["default"] = function(selected)
            vim.cmd("cd " .. selected[1])
        end
    }
    opts.cwd = "~"
    opts.winopts = {
        height = 0.35,
        width = 1,
        row = 1
    }

    fzf_lua.fzf_exec("fd -H --type d", opts)
end

vim.keymap.set("n", "<leader>cc", _G.fzf_dirs)
