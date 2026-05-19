local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
    layout_strategy = 'horizontal',
    layout_config = { preview_width = 0.55 },
  },
  pickers = {
    find_files = {
      hidden = true,  -- show dotfiles
    },
  },
})

local opts = { noremap = true, silent = true }

-- File finding
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)   -- find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)    -- grep in project
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)      -- open buffers
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)    -- help
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, opts)     -- recent files
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, opts)  -- symbols in file
vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, opts) -- symbols in workspace
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, opts)  -- diagnostics
vim.keymap.set('n', '<leader>fc', builtin.git_commits, opts)  -- git commits
