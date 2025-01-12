-- plugins/ui.lua
return 
{
	{
		'nvim-lualine/lualine.nvim',
		-- enabled = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},

	},
	{
		'nanozuki/tabby.nvim',
		enabled = true,
		-- event = 'VimEnter', -- if you want lazy load, see below
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
	},
}

