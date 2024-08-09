local dapui = require("dapui")
dapui.setup()

local dap = require("dap")
vim.keymap.set(
    "n",
    "<leader>dd",
    function()
        dap.toggle_breakpoint()
    end
)
vim.keymap.set(
    "n",
    "<leader>dp",
    function()
        dap.continue()
    end
)
vim.keymap.set(
    "n",
    "<leader>ds",
    function()
        dap.stop()
    end
)
vim.keymap.set(
    "n",
    "<leader>dD",
    function()
        dap.disconnect()
    end
)
vim.keymap.set(
    "n",
    "<leader>dS",
    function()
        dap.terminate()
    end
)
vim.keymap.set(
    "n",
    "<leader>do",
    function()
        dap.step_over()
    end
)
vim.keymap.set(
    "n",
    "<leader>di",
    function()
        dap.step_into()
    end
)
vim.keymap.set(
    "n",
    "<leader>du",
    function()
        dap.step_out()
    end
)
vim.keymap.set(
    "n",
    "<leader>dw",
    function()
        dapui.toggle()
    end
)

local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local namespace = vim.api.nvim_create_namespace("dap-hlng")
vim.api.nvim_set_hl(namespace, "DapBreakpoint", {fg = "#E51500", bg = "#1E1E2F"})
vim.fn.sign_define("DapBreakpoint", {text = "⚫︎", texthl = "DapBreakpoint", linehl = "", numhl = ""})
