---@type LazySpec
return {
	'vyfor/cord.nvim',
	event = "VeryLazy",
	---@module "cord"
	---@type CordConfig
	opts = {
		editor = {
			tooltip = (function()
				local v = vim.version()
				return string.format('Neovim %d.%d.%d', v.major, v.minor, v.patch)
			end)()
		},
		display = {
			theme = "catppuccin",
			view = 'auto',
			swap_fields = true
		},
		extensions = {
			diagnostics = {
				scope = "workspace"
			},
			"resolver"
		},
		buttons = {
			{
				label = 'View Repository',
				url = (function(opts)
					local process = require('cord.core.uv.process')

					-- check visibility only once every 5 minutes
					local is_private = opts.cache:get_or_compute(opts.workspace_dir .. ':is_repo_private', 300,
						function()
							local result = process.spawn({
								cmd = 'gh',
								args = { 'repo', 'view', '--json', 'isPrivate', '--template', '{{.isPrivate}}' },
								cwd = opts.workspace_dir
							}):await()

							-- assume private if command fails
							if not result or result.code ~= 0 then
								-- we must return a non-nil value
								return false
							end
							return vim.trim(result.stdout)
						end)

					if is_private == 'true' then return end -- hide button for private repos

					return opts.repo_url
				end)
			}
		},
		hooks = {
		},
		text = {
			editing = function(opts)
				return string.format('Editing %s:%d:%d%s', opts.filename, opts.cursor_line, opts.cursor_char,
					vim.bo.modified and "[+]" or "")
			end,
		},
	}
}
