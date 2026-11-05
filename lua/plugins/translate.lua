return {
	'noir4y/comment-translate.nvim',
	event = "LazyFile",
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
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
}
