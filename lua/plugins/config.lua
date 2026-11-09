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
		config = function()
			for _, config in ipairs(vim.lsp.get_configs()) do
				local cmd = config.cmd
				local exe = nil
				if config.name:match("^(gitlab_duo)$") then
					goto continue
				end
				-- . 根據 cmd 的型別安全地解析出執行檔名稱
				if type(cmd) == "table" then
					exe = cmd[1]
				elseif type(cmd) == "function" and config.name:match("^()$") then
					-- 嘗試調用函式取得動態回傳的指令結構
					local ok, res = pcall(cmd)
					if ok and type(res) == "table" then
						exe = res[1]
					elseif ok and type(res) == "string" then
						exe = res
					end
				elseif type(cmd) == "string" then
					exe = cmd
				else
					print(config.name .. ": cmd type=" .. type(cmd) .. ";" .. vim.inspect(cmd))
				end

				-- 2. 驗證執行檔是否存在於系統 PATH 中
				if exe and type(exe) == "string" and vim.fn.executable(exe) == 1 then
					print("auto-enabling: " .. config.name .. " (via " .. exe .. ")")
					vim.lsp.enable(config.name)
				end
				::continue::
			end
		end
	},
}
