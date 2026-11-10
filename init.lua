-- https://github.com/folke/snacks.nvim/blob/main/docs/debug.md
_G.dd = function(...)
	Snacks.debug.inspect(...)
end
_G.bt = function()
	Snacks.debug.backtrace()
end
if vim.fn.has("nvim-0.11") == 1 then
	---@diagnostic disable-next-line: duplicate-set-field
	vim._print = function(_, ...)
		dd(...)
	end
else
	vim.print = dd
end


-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.commands")
require("config.lsp")
