-- Automatically discover and enable all LSP configs in ~/.config/nvim/lsp/
local lsp_dir = vim.fn.stdpath("config") .. "/lsp"

if vim.fn.isdirectory(lsp_dir) == 1 then
	local config_files = vim.fn.globpath(lsp_dir, "*.lua", false, true)
	for _, file in ipairs(config_files) do
		-- Extract filename without extension (e.g., "nu-lint.lua" -> "nu-lint")
		local server_name = vim.fn.fnamemodify(file, ":t:r")
		-- print("enable ", server_name)
		vim.lsp.enable(server_name)
	end
end
