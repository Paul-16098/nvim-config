-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-A-f>", function()
	LazyVim.format({ force = true })
end, { desc = "Format" })

vim.keymap.set({ "n", "i" }, "<C-PageUp>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set({ "n", "i" }, "<C-PageDown>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

vim.keymap.del("n", "<leader>E")
vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "<C-w>", "<cmd>:bd<cr>", { desc = "Close Window" })

vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "k")

vim.keymap.set({ "n", "x" }, "<C-/>", "gcc", { remap = true, desc = "Toggle comment line" })

vim.keymap.set("n", "k", vim.lsp.buf.hover, { desc = "Hover" })

vim.keymap.set({ "n", "i" }, "<C-z>", "<cmd>:undo<cr>", { desc = "Undo" })
vim.keymap.set({ "n", "i" }, "<C-S-z>", "<cmd>:redo<cr>", { desc = "Redo" })
vim.keymap.set("n", "<C-n>", "<cmd>enew<CR>", { desc = "Create new buffer" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward" })
vim.keymap.set("i", "<C-Del>", "<C-o>de", { desc = "Delete word forward" })

-- vim.keymap.set("n", "<leader>xd", function()
-- Snacks.picker.diagnostics()
-- end, { desc = "Open Diagnostic Picker" })

-- File and word navigation (Helix parity)
vim.keymap.set({ "n", "x" }, "<C-Home>", "gg", { desc = "Go to file start" })
vim.keymap.set({ "n", "x" }, "<C-End>", "G", { desc = "Go to file end" })
vim.keymap.set({ "n", "x" }, "<C-Left>", "ge", { desc = "Move previous word end" })
vim.keymap.set({ "n", "x" }, "<C-Right>", "w", { desc = "Move next word start" })
-- Physical PageUp and PageDown keys
vim.keymap.set({ "n", "x" }, "<PageUp>", "<C-b>", { desc = "Page Up" })
vim.keymap.set({ "n", "x" }, "<PageDown>", "<C-f>", { desc = "Page Down" })

-- Toggle soft wrap with Alt-z (matching Helix A-z)
vim.keymap.set("n", "<M-z>", function()
	vim.wo.wrap = not vim.wo.wrap
	print("Wrap: " .. (vim.wo.wrap and "Enabled" or "Disabled"))
end, { desc = "Toggle Soft Wrap" })

-- Move lines up and down in Normal mode
vim.keymap.set("n", "<A-down>", "<cmd>execute 'move .+' . v:count1<CR>==", { desc = "Move Line Down" })
vim.keymap.set("n", "<A-up>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "Move Line Up" })

-- Move lines up and down in Visual mode (preserves selection & auto-indents)
vim.keymap.set("v", "<A-down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "<A-up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "Move Selection Up" })

-- Move lines up and down in Insert mode
vim.keymap.set("i", "<A-down>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move Line Down" })
vim.keymap.set("i", "<A-up>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move Line Up" })

-- lua/config/keymaps.lua
local function add_cursor_vertical(direction)
	local mc_ns = vim.api.nvim_create_namespace("nvim.multicursor")
	local win = vim.api.nvim_get_current_win()
	local cursor = vim.api.nvim_win_get_cursor(win)
	local row, col = cursor[1] - 1, cursor[2] -- Convert to 0-indexed row for extmarks

	-- Ensure the primary cursor is registered in the native multi-cursor session
	vim.api.nvim_buf_set_extmark(0, mc_ns, row, col, {})

	local target_row = row + direction
	local line_count = vim.api.nvim_buf_line_count(0)

	if target_row >= 0 and target_row < line_count then
		-- Clamp column to the target line's length (matching VS Code behavior)
		local target_line = vim.api.nvim_buf_get_lines(0, target_row, target_row + 1, false)[1] or ""
		local target_col = math.min(col, #target_line)

		vim.api.nvim_buf_set_extmark(0, mc_ns, target_row, target_col, {})
	end
end

-- Bind Ctrl+Alt+Up / Ctrl+Alt+Down (Neovim uses <C-M-...> for Control + Alt)
vim.keymap.set({ "n", "i" }, "<C-M-Up>", function()
	add_cursor_vertical(-1)
end, { desc = "Add Multi-Cursor Above" })

vim.keymap.set({ "n", "i" }, "<C-M-Down>", function()
	add_cursor_vertical(1)
end, { desc = "Add Multi-Cursor Below" })
