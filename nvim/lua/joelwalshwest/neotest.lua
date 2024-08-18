local neotest = require("neotest")

local golang = require("neotest-golang")
local python =
    require("neotest-python")(
    {
        dap = {justMyCode = false}
    }
)

neotest.setup(
    {
        adapters = {golang, python}
    }
)

vim.keymap.set(
    "n",
    "<leader>u",
    function()
        neotest.run.run()
    end
)
vim.keymap.set(
    "n",
    "<leader>U",
    function()
        neotest.run.run({strategy = "dap"})
    end
)

vim.keymap.set(
    "n", 
    "gu",
    function()
        require("neotest").output.open()
    end
)
