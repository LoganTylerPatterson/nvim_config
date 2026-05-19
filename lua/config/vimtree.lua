vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,  -- show dotfiles (.eslintrc, .prettierrc, .env.example, etc.)
  },
})

-- Toggle file tree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })
