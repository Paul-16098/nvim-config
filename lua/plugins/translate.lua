---@type LazySpec
return {
	'noir4y/comment-translate.nvim',
	event = "LazyFile",
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	---@module "comment-translate"
	---@type CommentTranslateConfig
	---@diagnostic disable: missing-fields
	opts = {
		translate_service = 'google', -- 'google' or 'llm'
		llm = {
			provider = 'ollama',
			-- model = '',
		},

		hover = {
			enabled = false
		},
		immersive = {
			enabled = false
		},
		keymaps = {
			hover = false,
			hover_manual = false,
			replace = false,
			toggle = false,
		}
	}
	---@diagnostic enable: missing-fields
}
