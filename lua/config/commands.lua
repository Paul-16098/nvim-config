-- lua/config/keymaps.lua

-- Define :Bdo to keep the current buffer and wipe out the rest
vim.api.nvim_create_user_command("Bdo", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			if not vim.bo[buf].modified then
				vim.api.nvim_buf_delete(buf, { force = false })
			end
		end
	end
end, { desc = "Close all other buffers" })

-- Safe lowercase abbreviation for command mode only
vim.cmd([[
  cnoreabbrev <expr> bdo (getcmdtype() == ':' && getcmdline() == 'bdo') ? 'Bdo' : 'bdo'
]])

require("config.commands.GenerateStaticLsp")
require("config.commands.AddLicense")
