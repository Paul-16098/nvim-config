-- lua/config/keymaps.lua

for _, file in ipairs(vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/config/commands", "*.lua", false, true)) do
	require("config.commands." .. vim.fn.fnamemodify(file, ":t:r"))
end
