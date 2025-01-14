return 
{
	{
		"kevinhwang91/nvim-ufo",
		enable = true,
		event = "BufReadPre",
		dependencies = { { "kevinhwang91/promise-async" }, },
		-- opts = {},
		config = function()
			vim.opt.foldcolumn = '4'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true
			-- vim.opt.foldmethod = "syntax"
			-- WARN: you don't want this on!
			-- vim.opt.foldclose = "all"
			require('ufo').setup()
		end,
	}
}
