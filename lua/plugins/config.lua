---@type LazySpec
return {
	{
		"akinsho/bufferline.nvim",
		---@module "bufferline"
		---@type bufferline.UserConfig
		opts = { options = { always_show_bufferline = true } },
	},
	-- { "stevearc/conform.nvim", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { {
					"overseer",
					label = "task:",
					fmt = function(str)
						if str == "task:" then
							return ""
						else
							return str
						end
					end
				}, "lsp_status" },

				lualine_x = { "%S", "diagnostics" },
				lualine_y = { "location", "progress" },
				lualine_z = { "encoding", "fileformat", "filetype" },
			},
		},
	},
	{
		"folke/snacks.nvim",
		---@module "snacks"
		---@type snacks.Config
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
						patterns = { ".git", ".venv", ".github", ".gitignore", "pyproject.toml" },
						dev = { "~\\Documents\\git" },
					},
				}
			}
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			---@type vim.diagnostic.Opts
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
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			install = {
				compilers = { "cl" },
			},
		}
	},
	{
		"stevearc/overseer.nvim",
		---@module "overseer"
		---@type overseer.SetupOpts
		opts = {
			actions = {
				save = {
					desc = "save task as lua",
					run = function(task)
						local b = vim.api.nvim_create_buf(true, true)
						vim.bo[b].filetype = "lua"
						local t = 'require("overseer").new_task(' .. vim.inspect(task:serialize()) .. ')'
						vim.api.nvim_buf_set_text(b, 0, 0, 0, 0, vim.split(t, "\n", { plain = true }))
					end
				}
			}
		}
	}
}
