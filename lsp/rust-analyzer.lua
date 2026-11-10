return {
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy", -- 關鍵：將檢查指令改為 clippy
			},
		}
	}
}
