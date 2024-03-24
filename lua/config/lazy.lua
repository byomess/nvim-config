local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- import/override with your plugins
    { import = "plugins" },

    {
      "navarasu/onedark.nvim",
      config = function()
        require("onedark").setup({
          style = "deep",
          -- style = "cool",
          -- style = "warm"
          -- style = "darker",
          -- style = "warmer",
        })
      end,
    },
    { "folke/tokyonight.nvim" },
    { "getomni/neovim" },

    -- Configure LazyVim to load gruvbox

    -- {
    --   "xthreme",
    --   config = function()
    --     vim.cmd("colorscheme xthreme")
    --   end,
    --   dir = vim.fn.stdpath("config") .. "colors",
    -- },

    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "onedark",
      },
    },
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
  install = { colorscheme = { "tokyonight", "habamax" } },
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
