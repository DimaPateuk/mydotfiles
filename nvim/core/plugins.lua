require('ensure_packer')
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
		
	}

	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	use 'onsails/lspkind-nvim'
	use 'L3MON4D3/LuaSnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'


	use 'nvim-treesitter/nvim-treesitter'

	use({
			"glepnir/lspsaga.nvim",
			opt = true,
			branch = "main",
			event = "LspAttach",
			config = function()
					require("lspsaga").setup({
						finder = {
							keys = {
									quit = { 'q', '<esc>' },
									open = { 'o' },
									close_in_preview = '<esc>',
							},
						},

					})
			end,
			requires = {
					{"nvim-tree/nvim-web-devicons"},
					--Please make sure you install markdown and markdown_inline parser
					{"nvim-treesitter/nvim-treesitter"}
			}
	})
	-- use({
	-- 	'projekt0n/github-nvim-theme',
	-- 	config = function()
	-- 		require('github-theme').setup({
	-- 		})
	
	-- 		vim.cmd('colorscheme github_dark')
	-- 	end
	-- })
	use "rebelot/kanagawa.nvim"

	-- https://github.com/MunifTanjim/prettier.nvim
	-- use('jose-elias-alvarez/null-ls.nvim')
	-- use('MunifTanjim/prettier.nvim')
	use 'pangloss/vim-javascript'    --JavaScript support
	use 'leafgarland/typescript-vim' --TypeScript syntax
	use 'maxmellon/vim-jsx-pretty'   --JS and JSX syntax
	use 'jparise/vim-graphql'        --GraphQL syntax



	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/eslint.nvim'
end)
