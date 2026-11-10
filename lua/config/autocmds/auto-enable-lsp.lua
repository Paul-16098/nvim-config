vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "nvim-lspconfig" then
			-- 延遲 300ms 避開外掛載入瞬間的效能高峰
			vim.defer_fn(function()
				local configs = vim.lsp.get_configs()
				local i = 1
				local batch_size = 10 -- 每批次處理 10 個伺服器

				local function process_batch()
					local end_idx = math.min(i + batch_size - 1, #configs)
					for idx = i, end_idx do
						local config = configs[idx]
						local cmd = config.cmd
						local exe = nil

						if not config.name:match("^(gitlab_duo)$") then
							if type(cmd) == "table" then
								exe = cmd[1]
							elseif type(cmd) == "function" then
								local ok, res = pcall(cmd)
								if ok and type(res) == "table" then
									exe = res[1]
								elseif ok and type(res) == "string" then
									exe = res
								end
							elseif type(cmd) == "string" then
								exe = cmd
							end

							if exe and not exe:match("^(npm|dotnet|npx|python)$") then
								if type(exe) == "string" and vim.fn.executable(exe) == 1 then
									vim.lsp.enable(config.name)
								end
							end
						end
					end

					i = end_idx + 1
					-- 如果還沒處理完，排程下一批（間隔 10ms）
					if i <= #configs then
						vim.defer_fn(process_batch, 10)
					end
				end

				process_batch()
			end, 300)
		end
	end,
})
