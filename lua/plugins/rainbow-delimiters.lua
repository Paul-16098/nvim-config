return {
	"HiPhish/rainbow-delimiters.nvim",
	submodules = false,
	event = "BufReadPost",
	main = "rainbow-delimiters.setup",
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
