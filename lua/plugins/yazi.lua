---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	keys = {
		{
			"<leader>e",
			"<cmd>Yazi<cr>",
			mode = { "n", "v" },
			desc = "Open yazi at the current file",
		},
		{
			"<leader>E",
			"<cmd>Yazi cwd<cr>",
			mode = { "n", "v" },
			desc = "Open yazi at cwd",
		}
	},
	---@module "yazi"
	---@type YaziConfig
	opts = {
		open_for_directories = true,
		keymaps = false
	},
}
