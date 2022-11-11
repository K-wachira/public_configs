vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	-- You add plugins here  
	-- Color Scheme
	use 'gruvbox-community/gruvbox'
	
	-- ntree
	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
end)
