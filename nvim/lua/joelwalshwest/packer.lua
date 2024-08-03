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
end)

