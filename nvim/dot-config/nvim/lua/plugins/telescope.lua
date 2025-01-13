-- NOTE: you can do `:Telescope builtin` with the cursor on an identifier
-- then type "references" to get to the lsp_references and it will list
-- all the LSP references for that identifier. Try uncommenting the code
-- below and then putting your cursor on "example", then do the above.
-- 
-- local example = "hi"
-- print(example)
-- if example then
-- 	print("WOW")
-- end
--
-- example = "yup"

return 
{
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup({
				-- pickers = { find_files = { theme = "cursor" } },
				extensions = { fzf = {} },
			})

			require('telescope').load_extension('fzf')

			vim.keymap.set("n", "<Leader>fh", require('telescope.builtin').help_tags)
			vim.keymap.set("n", "<Leader>ff", require('telescope.builtin').find_files)
			vim.keymap.set("n", "<Leader>fi", function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath("config")
				}
			end)
			vim.keymap.set("n", "<Leader>fp", function()
				require('telescope.builtin').find_files {
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
				}
			end)

			require("config.telescope.multigrep").setup()
		end,
	}
}
