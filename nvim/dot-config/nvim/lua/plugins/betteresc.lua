return -- some comment
{
	{
		"max397574/better-escape.nvim",
		-- config = function()
		-- 	require("better_escape").setup()
		-- end,
		opts = {
			default_mappings = false,

			-- mappings = { t = false, v = false },
			mappings = {
				i = {
					j = {
						k = "<Esc>",
					},
					k = {
						j = "<Esc>",
					},
				},
				c = {
					k = {
						j = "<Esc>",
					},
					j = {
						k = "<Esc>",
					},
				},
				t = {
					k = {
						j = "<C-\\><C-n>",
					},
					j = {
						k = "<C-\\><C-n>",
					},
				},
				-- v = {
				-- 	j = {
				-- 		k = "<Esc>",
				-- 	},
				-- },
				-- s = {
				-- 	j = {
				-- 		k = "<Esc>",
				-- 	},
				-- },
			},
		},
	}
}

-- lua, default settings
-- require("better_escape").setup {
--     timeout = vim.o.timeoutlen,
--     default_mappings = true,
--     mappings = {
--         i = {
--             j = {
--                 -- These can all also be functions
--                 k = "<Esc>",
--                 j = "<Esc>",
--             },
--         },
--         c = {
--             j = {
--                 k = "<Esc>",
--                 j = "<Esc>",
--             },
--         },
--         t = {
--             j = {
--                 k = "<C-\\><C-n>",
--             },
--         },
--         v = {
--             j = {
--                 k = "<Esc>",
--             },
--         },
--         s = {
--             j = {
--                 k = "<Esc>",
--             },
--         },
--     },
-- }
