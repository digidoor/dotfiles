-- plugins/which.lua
return 
{
	{
		"folke/which-key.nvim",
		-- enabled = false,
		event = "VeryLazy",
		opts = {},
		keys = {
    		{
    			"<leader>?",
    			function()
        			require("which-key").show({ global = false })
    			end,
    			desc = "Buffer Local Keymaps (which-key)",
    		},
		},
	}
}
