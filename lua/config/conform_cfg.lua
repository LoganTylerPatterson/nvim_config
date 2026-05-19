-- Formatting with conform.nvim
-- Requires prettier in the project (./node_modules/.bin/prettier) or globally
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    graphql = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
})
