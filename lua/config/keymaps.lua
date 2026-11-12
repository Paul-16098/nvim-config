-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-A-f>", function()
	---@diagnostic disable-next-line: undefined-global
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

vim.keymap.set({ "n", "x" }, "<C-Home>", "gg", { desc = "Go to file start" })
vim.keymap.set({ "n", "x" }, "<C-End>", "G", { desc = "Go to file end" })
vim.keymap.set({ "n", "x" }, "<C-Left>", "ge", { desc = "Move previous word end" })
vim.keymap.set({ "n", "x" }, "<C-Right>", "w", { desc = "Move next word start" })

vim.keymap.set({ "n", "x" }, "<PageUp>", "<C-b>", { desc = "Page Up" })
vim.keymap.set({ "n", "x" }, "<PageDown>", "<C-f>", { desc = "Page Down" })

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

-- Bind Ctrl+Alt+Up / Ctrl+Alt+Down (Neovim uses <C-M-...> for Control + Alt)
vim.keymap.set({ "n", "i" }, "<C-M-Up>", "Q<up>", { desc = "Add Multi-Cursor Above" })

vim.keymap.set({ "n", "i" }, "<C-M-Down>", "Q<Down>", { desc = "Add Multi-Cursor Below" })

vim.keymap.del('n', "<leader>us")

vim.keymap.set("n", "<F2>", "<leader>cr", { remap = true })
