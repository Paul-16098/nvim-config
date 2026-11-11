---@type LazySpec
return (function()
	---@type table
	local ps = {}

	local dp = {
		"akinsho/bufferline.nvim",
		'noir4y/comment-translate.nvim',
	}

	-- Use ipairs and capture both index and value (or ignore index with _)
	for _, name in ipairs(dp) do
		table.insert(ps, {
			name,
			keys = function()
				return {}
			end,
		})
	end

	return ps
end)()
