-- https://github.com/moznion/cccc
vim.api.nvim_create_user_command("Cccc", function(args)
	local o = vim.fn.system(vim.list_extend({ "cccc", args.bang and "--cache" or "--no-cache" },
		#args.fargs == 0 and { vim.fn.expand("%:p") } or args.fargs))
	local d = vim.json.decode(o)

	---@type vim.quickfix.entry
	local qf = {}
	for _, file in ipairs(d.files) do
		for _, fn in ipairs(file.functions) do
			table.insert(qf, {
				filename = file.path,
				lnum = fn.line,
				text = string.format(
					"[%s] %s — cognitive: %d, cyclomatic: %d",
					fn.kind, fn.name, fn.cognitive, fn.cyclomatic
				),
				type = fn.cognitive >= 15 and "E" or "W"
			})
		end
	end

	vim.fn.setqflist({}, "r", { title = "cccc", items = qf })
	vim.cmd("copen")
end, { nargs = "*", range = false, desc = "cccc in quickfix" })

vim.keymap.set("n", "<leader>xc", "<cmd>Cccc .<cr>", { desc = "cccc quickfix" })
vim.keymap.set("n", "<leader>xC", "<cmd>Cccc<cr>", { desc = "cccc quickfix (Trouble)" })
