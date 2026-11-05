---@param name string
---@param opts table
---@return vim.api.keyset.get_hl_info
local function deep_extend(name, opts)
  return (vim.tbl_deep_extend("force",
    vim.api.nvim_get_hl(0, { name = name, link = false }),
    opts
  ))
end


return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      custom_highlights = {
        DiagnosticVirtualLinesHint = deep_extend("DiagnosticVirtualLinesHint", { italic = false })
      }
    }
  }
}
