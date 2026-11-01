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

				lualine_x = { "%S", "diagnostics" },
				lualine_y = { "location", "progress" },
				lualine_z = { "encoding", "fileformat", "filetype" },
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			explorer = {
				enabled = false,
			},
			indent = {
				enabled = false,
			},
			picker = {
				sources = {
					projects = {
						dev = { "~\\Documents\\git" },
					},
				}
			}
		},
	},
}
