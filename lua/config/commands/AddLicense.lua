vim.api.nvim_create_user_command("AddLicense", function()
	vim.system({ "gh", "api", "--paginate", "/licenses" }, { text = true }, function(out)
		if out.code ~= 0 or not out.stdout then
			vim.schedule(function()
				vim.notify("無法取得 GitHub Licenses 列表", vim.log.levels.ERROR)
			end)
			return
		end

		local ok, licenses = pcall(vim.json.decode, out.stdout)
		if not ok or type(licenses) ~= "table" then return end

		local items = {}
		for _, lic in ipairs(licenses) do
			table.insert(items, { name = lic.name, key = lic.key })
		end

		vim.schedule(function()
			vim.ui.select(items, {
				prompt = "選擇要新增的 License:",
				format_item = function(item)
					return item.name .. " (" .. item.key .. ")"
				end,
			}, function(choice)
				if not choice then return end

				vim.system({ "gh", "api", "--paginate", "/licenses/" .. choice.key },
					{ text = true }, function(lic_out)
						if lic_out.code ~= 0 or not lic_out.stdout then return end

						local _, data = pcall(vim.json.decode, lic_out.stdout)
						if not data or not data.body then return end

						-- 1. 自動從 git config 取得使用者名稱（若無則退回預設值）
						local handle = io.popen("git config user.name")
						local author = handle and handle:read("*a") or ""
						if handle then handle:close() end
						author = vim.trim(author)
						if author == "" then author = "Author" end

						local year = os.date("%Y")
						local body = data.body

						-- 2. 自動替換 GitHub API 授權條款常見的佔位符
						body = body:gsub("%[year%]", year)
						body = body:gsub("%[yyyy%]", year)
						body = body:gsub("<year>", year)
						body = body:gsub("%[fullname%]", author)
						body = body:gsub("<copyright holders>", author)
						body = body:gsub("<owner>", author)

						vim.schedule(function()
							-- 3. 寫入檔案
							local filepath = vim.fn.getcwd() .. "/LICENSE.txt"
							local file = io.open(filepath, "w")
							if file then
								file:write(body)
								file:close()
								vim.cmd("edit " .. filepath)
							end
						end)
					end)
			end)
		end)
	end)
end, { desc = "使用 GitHub API 下載並自動填入資訊的 License" })
