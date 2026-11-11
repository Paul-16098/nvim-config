---@type LazySpec
return {
	"HiPhish/rainbow-delimiters.nvim",
	submodules = false,
	event = "BufReadPost",
	main = "rainbow-delimiters.setup",
	---@module "rainbow-delimiters"
	---@type rainbow_delimiters.config
	opts = {
		highlight = {
			"rainbow1",
			"rainbow2",
			"rainbow3",
			"rainbow4",
			"rainbow5",
			"rainbow6",
		},
	},
}
