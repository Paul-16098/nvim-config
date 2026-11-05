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
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				severity_sort = true,
				update_in_insert = true,

				virtual_lines = {
					current_line = true,
				},
				virtual_text = {
					current_line = false,
					severity = { min = vim.diagnostic.severity.WARN }
				},
			},
		},
	},
}
