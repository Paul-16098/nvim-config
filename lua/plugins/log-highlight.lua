return {
	'fei6409/log-highlight.nvim',
	event = "LazyFile",
	opts = {
		pattern = {
			".*%.log%.txt",
			"Log[0-9]+%.txt"
		}
	},
}
