require("config.lazy")

--Relative Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
--Diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = '󰳧', -- Could be 'X', '!', or a nerd font icon
		spacing = 4,
	},
	--Show errors on new Line
	virtual_line = false,
	--No Symbols in the gutter
	signs = false,
	-- Show errors even while you are typing
	update_in_insert = true,
	-- Sort diagnostics by severity
	severity_sort = true,
})

vim.opt.termguicolors = true

vim.cmd.colorscheme("dms")
