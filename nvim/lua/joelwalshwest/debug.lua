require("dapui").setup()

local dap = require("dap")
vim.keymap.set("n", "<leader>dd", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dp", function() dap.continue() end)
vim.keymap.set("n", "<leader>ds", function() dap.stop() end)
vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<leader>du', function() dap.step_out() end)

