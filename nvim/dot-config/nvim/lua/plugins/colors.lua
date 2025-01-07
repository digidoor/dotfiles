-- /lua/plugins/colors.lua
return
{
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function() vim.cmd.colorscheme "tokyonight" end,
		priority = 1000,
		opts = {},
	},
	{ -- color: #009988
    	"catgoose/nvim-colorizer.lua",
    	event = "BufReadPre",
    	opts = { -- set to setup table
    	},
    	config = function()
    		require('colorizer').setup({
    			filetypes = {
    				"css",
    				"javascript",
    				html = { mode = "foreground" },
    			},
    		})
    	end
	},
}
