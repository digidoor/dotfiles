return 
{
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		---
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
			-- level = vim.log.levels.TRACE,
			styles = {
				notification = {
					wo = { wrap = true } -- Wrap notifications
				},
				notification_history = {
					border = "rounded",
					zindex = 100,
					width = 0.6,
					height = 0.6,
					minimal = false,
					title = " Notification History ",
					title_pos = "center",
					ft = "markdown",
					bo = { filetype = "snacks_notif_history", modifiable = false },
					wo = { winhighlight = "Normal:SnacksNotifierHistory" },
					keys = { q = "close" },
				},
			},
		},
		config = function(_, opts)
			require("snacks").setup(opts)
			-- additional config
			vim.api.nvim_create_user_command('Messages', function()
				require('snacks').notifier.show_history()
			end, { nargs = '*' })
			vim.cmd('cabbrev messages Messages')
			vim.cmd('cabbrev m Messages')
		end,
	}
}
