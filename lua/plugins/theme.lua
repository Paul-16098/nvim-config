local function deep_extend(name, ...)
  return (vim.tbl_deep_extend("force",
    vim.api.nvim_get_hl(0, { name = name, link = false }),
    ...
  ))
end


---@type LazySpec
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
    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
      highlight_overrides = {
        all = function()
          return {
            DiagnosticVirtualLinesHint = deep_extend("DiagnosticVirtualLinesHint", { italic = false }),
            DiagnosticVirtualLinesWarn = deep_extend("DiagnosticVirtualLinesWarn", { italic = false }),
            DiagnosticVirtualLinesError = deep_extend("DiagnosticVirtualLinesError", { italic = false }),
            DiagnosticVirtualLinesInfo = deep_extend("DiagnosticVirtualLinesInfo", { italic = false }),
          }
        end,
      }
    }
  }
}
