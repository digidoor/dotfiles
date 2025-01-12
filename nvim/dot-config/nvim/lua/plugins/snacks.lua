return 
{
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = false },
			dashboard = { enabled = false },
			indent = { enabled = false },
			input = { enabled = false },
			notifier = { enabled = true },
			quickfile = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			styles = {
				notification = {
					wo = { wrap = true } -- Wrap notifications
				}
			}
		},
	}
}
