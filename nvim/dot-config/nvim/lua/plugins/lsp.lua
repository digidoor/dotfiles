local myTable = {
	1,
	2,
	3,
	4,
	5,
}
print("lsp.lua is here")  
return
{
	{
		'neovim/nvim-lspconfig',
		enabled = true,
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require('lspconfig').lua_ls.setup {
				settings = {
					Lua = { hint = { arrayIndex = "Enabled" } }
				}
			}
		end,
	},
	-- { -- optional cmp completion source for require statements and module annotations
	-- 	"hrsh7th/nvim-cmp",
	-- 	opts = function(_, opts)
	-- 		opts.sources = opts.sources or {}
	-- 		table.insert(opts.sources, {
	-- 			name = "lazydev",
	-- 			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
	-- 		})
	-- 	end,
	-- },
	-- { -- optional blink completion source for require statements and module annotations
	-- 	"saghen/blink.cmp",
	-- 	opts = {
	-- 		sources = {
	-- 			-- add lazydev to your completion providers
	-- 			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
	-- 			providers = {
	-- 				lazydev = {
	-- 					name = "LazyDev",
	-- 					module = "lazydev.integrations.blink",
	-- 					-- make lazydev completions top priority (see `:h blink.cmp`)
	-- 					score_offset = 100,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- }
	-- -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
