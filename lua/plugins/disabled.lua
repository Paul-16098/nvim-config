return (function()
	local ps = {}

	local dp = { "mason-org/mason-lspconfig.nvim", "mason-org/mason.nvim" }

	for _, name in ipairs(dp) do
		table.insert(ps, {
			name,
			enabled = false,
		})
	end

	return ps
end)()
