-- plugins/comment.lua
-- This plugin is supposed to comment out stuff in the appropriate format,
-- say if we had an html file with a bunch of <script> sections, it should
-- use html or JS comments wherever the correct one is appropriate.
-- It doesn't work.
return 
{
	{
		-- this shit doesn't even work, btw
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- opts = {},
		config = function()
			require('ts_context_commentstring').setup({})
		end,
	}
}

