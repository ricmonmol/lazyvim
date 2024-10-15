return {
  "rmagatti/goto-preview",
  config = function()
    require("goto-preview").setup({
      default_mappings = true,
      height = 25, -- Height of the floating window
    })
  end,
}
