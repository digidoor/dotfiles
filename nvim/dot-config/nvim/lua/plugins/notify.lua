-- plugins/notify.lua
return 
{
	{
		"rcarriga/nvim-notify",
		enabled = false,
		config = function()
			vim.notify = require("notify")
			vim.notify("Hello.")
			vim.notify.setup({
				vim.notify._config(),
				render = "wrapped-compact",
			})
		end,
		-- I gotta figure out how to configure this one in lua
	}
}
