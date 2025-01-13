return 
{
	{
		'echasnovski/mini.files',
		version = false,
		opts = {},
		config = function()
			vim.keymap.set("n", "<Leader>m", require('mini.files').open, { desc = "mini.files", silent = true, noremap = true })
			require('mini.files').setup()
		end,
	}
}
