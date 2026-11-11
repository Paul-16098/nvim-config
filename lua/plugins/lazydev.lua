---@type LazySpec
return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			-- 讓 lazydev 自動載入 luv 類型
			{ path = "${3rd}/luv/library", words = { "vim._uv" } },
			-- 關鍵：手動將 lazy.nvim 加入庫路徑，以正確識別 LazySpec
			{ path = "lazy.nvim",          words = { "LazySpec" } },
		},
	},
}
