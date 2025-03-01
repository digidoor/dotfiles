-- we already set this in our init.lua so we can use it with any terminal instance
--vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = { 
	floating = {
		buf = -1,
		win = -1,
	}
}

local function create_floating_window(opts) 
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if vim.api.nvim_win_is_valid(state.floating.win) then
		vim.api.nvim_win_hide(state.floating.win)
	else
		-- note that the argument to c_f_w is not an assignment but rather
		-- a table with a single key-value pair, the key being "buf"
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	end
	vim.cmd('normal i')
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set("n", "<space>t", toggle_terminal, { desc = "toggle floaterminal", silent = true, noremap = true})

