-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- telescope.nvim
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- catppuccin
  use ({ 
	  "catppuccin/nvim", 
	  as = "catppuccin" ,
	  config = function()
		vim.cmd('colorscheme catppuccin') 
	  end
  })

  -- tresitter
  use('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})

  -- harpoon
  use('theprimeagen/harpoon')

  -- undotree
  use('mbbill/undotree')

  -- fugitive
  use('tpope/vim-fugitive')

  -- lsp
  use('VonHeikemen/lsp-zero.nvim')
  use('neovim/nvim-lspconfig')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/nvim-cmp')

  -- debug
  use('mfussenegger/nvim-dap')
  use('mfussenegger/nvim-dap-python')
  use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} })
  use('HiPhish/debugpy.nvim')

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
end)

