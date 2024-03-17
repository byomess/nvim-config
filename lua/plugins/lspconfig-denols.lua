if true then return {} end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          cmd = { "deno", "lsp" },
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          root_dir = require("lspconfig.util").root_pattern("deno.json", ".git"),
        },
      },
    },
    setup = function()
      require("lspconfig").denols.setup({})
    end,
  },
}
