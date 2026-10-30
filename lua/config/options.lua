-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.sh = "nu"
vim.opt.shelltemp = false
vim.opt.shellredir = "out+err> %s"
vim.opt.shellcmdflag = "--stdin --no-newline -c"
vim.opt.shellxescape = ""
vim.opt.shellxquote = ""
vim.opt.shellquote = ""
vim.opt.shellcmdflag = "-c"

vim.g.snacks_animate = false

vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	nbsp = "⍽",
	tab = "→·", -- '→' is the starting character, '·' (tabpad) repeats for the rest
	-- eol = "⏎", -- Helix 'newline' maps to Neovim 'eol' (end of line)
}

-- Set tabs to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4    -- Number of spaces used for auto-indenting (e.g., >>, <<, or auto-indent)
vim.opt.expandtab = false -- Convert <Tab> keypresses into spaces automatically
vim.opt.softtabstop = 4   -- Number of spaces a <Tab> feels like while editing (deleting/inserting)

-- Allow virtual cursor positioning past the end of the line
vim.opt.virtualedit = "onemore"
vim.opt.whichwrap = "<,>,[,]"
vim.opt.winborder = "rounded"

vim.opt.spell = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_nvim_dir_plugin = 1

vim.opt.scrolloff = 9

vim.opt.wrap = true
vim.opt.breakindent = true
-- Custom wrapper around Snacks' statuscolumn to support soft-wrap symbols
function _G.custom_statuscolumn()
	-- If it's a soft-wrapped line segment, display the wrap symbol in the number column
	if vim.v.virtnum > 0 then
		return "  ↪ %="
	end

	-- Otherwise, delegate entirely to Snacks.statuscolumn for normal lines
	return require("snacks.statuscolumn").get()
end

-- Set Neovim's statuscolumn option to use our wrapper
vim.opt.statuscolumn = "%!v:lua.custom_statuscolumn()"
