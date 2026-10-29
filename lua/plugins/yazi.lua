---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	version = "*",
	-- lazy = false,
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	---@type YaziConfig | {}
	opts = {
		open_for_directories = true,
	},
}
