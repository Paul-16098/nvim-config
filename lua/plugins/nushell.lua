---@type LazySpec
return {
	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				nu = { "nufmt" },
			},
			formatters = {
				nufmt = {
					command = "nufmt",
					args = { "$FILENAME" },
					stdin = false,
				},
			},
		},
	},
}
