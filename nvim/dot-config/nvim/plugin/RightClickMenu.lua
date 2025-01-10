-- plugin/RightClickMenu.lua
local lsptest = true 
vim.cmd [[
	"subsequent line disables the default menu entries
	aunmenu PopUp
	anoremenu PopUp.Select\ All           ggVGy
	anoremenu PopUp.Copy                  gvy
	anoremenu PopUp.Paste                 p<Backspace>
	anoremenu PopUp.Cut                   gvd
	amenu     PopUp.-1-                   <NOP>
	anoremenu PopUp.New\ Vertical\ Split  :vnew<CR>
	anoremenu PopUp.Delete\ Buffer        :bd<CR>
	anoremenu PopUp.Close\ Window         <C-W>c
	amenu     PopUp.-2-                   <NOP>
	anoremenu PopUp.SysClip\ Select\ All  ggVG"+y
	anoremenu PopUp.SysClip\ Copy         gv"+y
	anoremenu PopUp.SysClip\ Paste        "+p<Backspace>
	amenu     PopUp.-3-                   <NOP>
	anoremenu PopUp.Inspect               <cmd>Inspect<CR>
	anoremenu PopUp.Go\ to\ definition    <cmd>lua vim.lsp.buf.definition()<CR>
	anoremenu PopUp.Rename                <cmd>lua vim.lsp.buf.rename()<CR>
	anoremenu PopUp.References            <cmd>lua vim.lsp.buf.references()<CR>
]]

local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
	pattern = "*",
	group = group,
	desc = "Custom PopUp Setup",
	callback = function()
		vim.cmd [[
			amenu disable PopUp.Go\ to\ definition
			amenu disable PopUp.References
			amenu disable PopUp.Rename
		]]

		if vim.lsp.get_clients({ bufnr = 0 })[1] then
			vim.cmd [[
				amenu enable PopUp.Go\ to\ definition
				amenu enable PopUp.References
				amenu enable PopUp.Rename
			]]
		end
	end,
})

-- everything working beautifully
