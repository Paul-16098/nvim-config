-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/

-- 使用 vim.lsp.config 为所有服务器 (*) 设置统一的 capabilities
vim.lsp.config("*", {
	capabilities = {
		-- 关键：只向服务器声明支持 UTF-16
		general = {
			positionEncodings = { "utf-16" },
		},
		-- 同时保留 offsetEncoding 以兼容部分旧版或特殊服务器
		offsetEncoding = { "utf-16" },
	},
})
require("config.auto_enabled_lsp")
