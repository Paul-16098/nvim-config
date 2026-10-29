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
