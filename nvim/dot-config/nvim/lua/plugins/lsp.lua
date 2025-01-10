-- plugins/lsp.lua
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
			-- require('lspconfig').lua_ls.setup {
			-- 	on_init = function(client)
			-- 		if client.workspace_folders then
			-- 			local path = client.workspace_folders[1].name
			-- 			if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
			-- 				return
			-- 			end
			-- 		end
			--
			-- 		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			-- 			runtime = {
			-- 				-- Tell the language server which version of Lua you're using
			-- 				-- (most likely LuaJIT in the case of Neovim)
			-- 				version = 'LuaJIT'
			-- 			},
			-- 			-- Make the server aware of Neovim runtime files
			-- 			workspace = {
			-- 				checkThirdParty = false,
			-- 				library = {
			-- 					vim.env.VIMRUNTIME
			-- 					-- Depending on the usage, you might want to add additional paths here.
			-- 					-- "${3rd}/luv/library"
			-- 					-- "${3rd}/busted/library",
			-- 				}
			-- 				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
			-- 				-- library = vim.api.nvim_get_runtime_file("", true)
			-- 			}
			-- 		})
			-- 	end,
			-- 	settings = {
			--  				Lua = {
			--  					hint = {
			--  						arrayIndex = "Auto",
			--  						await = true,
			--  						paramName = "All",
			--  						paramType = true,
			--  						semicolon = "All",
			--  						setType = true,
			--
			--  					}
			--  				},
			--  				-- Lua.hint.arrayIndex = "Enabled",
			-- 	}
			-- }
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
