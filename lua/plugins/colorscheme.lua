-- return {
--   { "rose-pine/neovim", name = "rose-pine" },
--   opts = {
--     transparent = true,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "rose-pine",
--       transparency = true,
--     },
--   },
-- }
--
-- return {
--   { "Shatur/neovim-ayu" },
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "ayu-dark",
--   },
-- }

-- return {
--   { "EdenEast/nightfox.nvim" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "carbonfox",
--     },
--   },
-- }

-- return {
--   { "RRethy/nvim-base16" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "base16-railscasts",
--     },
--   },
-- }

-- return {
--   { "rebelot/kanagawa.nvim" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "kanagawa-dragon",
--     },
--   },
-- }

return {
  {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_high_contrast",
    },
  },
}
-- return {
--   "ellisonleao/gruvbox.nvim",
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox-dark",
--     },
--   },
-- }
-- return {
--   "shaunsingh/nord.nvim",
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "nord",
--     },
--   },
-- }
-- return {
--   { "daschw/leaf.nvim" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "leaf",
--     },
--   },
