-- TODO: this is a test line
return 
{
	{
		'smoka7/hop.nvim',
		version = "*",
		opts = {
			keys = 'jfdkeruislatovnghywmcqpb',
		},
		config = function(_, opts)
			-- place this in one of your configuration file(s)
			local hop = require('hop')
			hop.setup(opts)
			local directions = require('hop.hint').HintDirection

			-- most basic hop
			vim.keymap.set("", "<Leader>ja", ":HopAnywhereMW<CR>", { desc = "Hop Anywhere" })
			-- hop to the beginning of a word
			vim.keymap.set("", "<Leader>jw", ":HopWordMW<CR>", { desc = "Hop to Word" })
			-- hop to the beginning of a camel case hump
			vim.keymap.set("", "<Leader>jm", ":HopCamelCaseMW<CR>", { desc = "Hop CamelCase" })
			-- hop character
			vim.keymap.set("", "<Leader>jc", ":HopChar1MW<CR>", { desc = "Hop to Char" })
			-- hop to a two-character combo
			vim.keymap.set("", "<Leader>jt", ":HopChar2MW<CR>", { desc = "Hop to 2Char" })
			-- hop to a line
			vim.keymap.set("", "<Leader>jl", ":HopLineStartMW<CR>", { desc = "Hop to Line" })
			-- hop to a different line but try to stay in the same column
			vim.keymap.set("", "<Leader>jv", ":HopVerticalMW<CR>", { desc = "Hop Vertically" })
			-- hop to a node. I think this requires lsp/treeshitter
			vim.keymap.set("", "<Leader>jn", ":HopNodes<CR>", { desc = "Hop to Node" })

			vim.keymap.set('', 'f', function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, {remap=true})
			vim.keymap.set('', 'F', function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, {remap=true})
			vim.keymap.set('', 't', function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end, {remap=true})
			vim.keymap.set('', 'T', function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end, {remap=true})
		end,
	}
}
