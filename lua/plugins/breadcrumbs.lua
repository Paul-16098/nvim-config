---@type LazySpec
return {
	"Bekaboo/dropbar.nvim",
	event = "LazyFile",
	---@module "dropbar"
	---@type dropbar_opts_t
	opts = {
		sources = { path = { preview = false } },
	},
}
