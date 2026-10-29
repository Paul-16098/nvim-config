return {
	{
		"akinsho/bufferline.nvim",
		opts = { options = { always_show_bufferline = true } },
	},
	-- { "stevearc/conform.nvim", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "lsp_status" },

				lualine_x = { "diagnostics" },
				lualine_y = { "location", "progress" },
				lualine_z = { "encoding", "fileformat", "filetype" },
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			-- Disable the explorer picker / tree component
			explorer = {
				enabled = false,
			},
			indent = {
				enabled = false,
			},
		},
	},
}
