return
{
	{
		'nvim-lualine/lualine.nvim',
		-- enabled = true, -- unnecessary since enabled is the default
		dependencies = { 'nvim-tree/nvim-web-devicons' },
--		config = function()
--			require('lualine').setup {
--				options = {
--					theme = 'tokyonight'
--				}
--			}
--		end,
		-- with this simple opts entry, the plugin is enabled with default opts
		opts = {}, -- either we use this or we uncomment the config function

	}
}

