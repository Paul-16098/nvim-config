---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	version = "*",
	lazy = false,
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
	---@module "yazi"
	---@type YaziConfig
	opts = {
		open_for_directories = true,
		keymaps = false
	},
}
