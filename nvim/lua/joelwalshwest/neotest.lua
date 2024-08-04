local neotest = require('neotest')

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
  },
})

vim.keymap.set('n', '<leader>u', function() neotest.run.run() end)
vim.keymap.set('n', '<leader>U', function() neotest.run.run({strategy='dap'}) end)


