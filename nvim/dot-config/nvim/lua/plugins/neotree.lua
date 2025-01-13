return
{
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			},
		config = function()
			vim.keymap.set("n", "<Leader>r", ":Neotree toggle<CR>", { desc = "Neotree toggle", silent = true, noremap = true })
			-- NOTE: perplixityAI recommends the following:
			-- vim.keymap.set("n", "<Leader>r", ":Neotree<CR>", { silent = true, noremap = true })
		end,
	},
}
