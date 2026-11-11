---@type LazySpec
return {
	"mrcjkb/rustaceanvim",
	---@module "rustaceanvim"
	---@type rustaceanvim.Config
	opts = {
		server = {
			default_settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
				},
			},
		},
	},
}
