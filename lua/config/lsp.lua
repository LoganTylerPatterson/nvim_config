local opts = { noremap = true, silent = true }

-- Diagnostic keymaps (global)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Enable inlay hints if supported by the server
  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- Format via conform (see conform_cfg.lua); <space>f triggers it
  vim.keymap.set('n', '<space>f', function()
    require('conform').format({ async = true, lsp_fallback = true })
  end, bufopts)
end

-- Capabilities with cmp-nvim-lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript / JavaScript via typescript-tools (enhanced tsserver)
-- Requires: npm install -g typescript typescript-language-server
require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- TypeScript-specific commands
    vim.keymap.set('n', '<space>oi', '<cmd>TSToolsOrganizeImports<CR>', bufopts)
    vim.keymap.set('n', '<space>ru', '<cmd>TSToolsRemoveUnusedImports<CR>', bufopts)
    vim.keymap.set('n', '<space>ai', '<cmd>TSToolsAddMissingImports<CR>', bufopts)
  end,
  capabilities = capabilities,
  settings = {
    separate_diagnostic_server = true,
    expose_as_code_action = { "all" },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayVariableTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
    },
  },
})

-- ESLint LSP for linting
-- Requires: npm install -g vscode-langservers-extracted
if vim.lsp.config then
  vim.lsp.config('eslint', {
    on_attach = function(client, bufnr)
      -- Fix all ESLint issues on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
    capabilities = capabilities,
  })
  vim.lsp.enable('eslint')
else
  -- Fallback for older Neovim versions if necessary, 
  -- though the user is clearly on a version that warns.
  require('lspconfig').eslint.setup({
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
    capabilities = capabilities,
  })
end

-- Diagnostics display config
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●',
    severity_sort = true,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
