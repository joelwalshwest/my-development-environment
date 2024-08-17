local neotest = require("neotest")

local golang = require("neotest-golang")
local python =
    require("neotest-python")(
    {
        dap = {justMyCode = false},
        is_test_file = function(file_path)
            -- print(filepath)
            return true
        end,
        pytest_discover_instances = true
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
