local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "one-dark" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      },
      i = {
        ["<C-h>"] = "which_key",
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      },
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      previewer = true,
      mappings = {
        i = {
          ["<C-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<C-d>"] = require("telescope.actions").delete_buffer,
        },
      },
      entry_maker = function(entry)
        local displayer = require("telescope.pickers.entry_display").create({
          separator = " ",
          items = {
            { width = 4 },
            { width = 2 },
            { remaining = true },
          },
        })

        local make_display = function(e)
          local mod = e.is_modified and "+" or " "
          local filename = vim.fn.fnamemodify(e.filename, ":p:~:.")
          return displayer({
            { e.bufnr, "TelescopeResultsNumber" },
            { mod, "TelescopeResultsComment" },
            { filename },
          })
        end

        local filename = vim.api.nvim_buf_get_name(entry.bufnr)
        return {
          valid = true,
          value = entry,
          ordinal = entry.bufnr .. " : " .. filename,
          display = make_display,
          bufnr = entry.bufnr,
          filename = filename,
          is_modified = vim.api.nvim_buf_get_option(entry.bufnr, "modified"),
        }
      end,
    },
  },
})

require("codecompanion").setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "AIzaSyAMvNtreHMO2W3hl9BSs_Ho7R_6ksFGcq8",
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "gemini",
    },
    agent = {
      adapter = "gemini",
    },
  },
})
