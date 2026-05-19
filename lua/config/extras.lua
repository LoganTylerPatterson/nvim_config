-- Gitsigns: git decorations in the gutter
require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    -- Actions
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, bufopts)
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, bufopts)
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, bufopts)
    vim.keymap.set('n', '<leader>hb', function() gs.blame_line({ full = true }) end, bufopts)
    vim.keymap.set('n', '<leader>hd', gs.diffthis, bufopts)
  end,
})

-- Autopairs: auto-close brackets, quotes, etc.
require('nvim-autopairs').setup({
  check_ts = true,  -- use treesitter for smarter pairing
})
-- Integrate with cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Comment: gc to comment lines/motions, gb for block comments
require('Comment').setup()

-- Trouble: diagnostics panel
require('trouble').setup()
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>', { noremap = true, silent = true })

-- Supermaven: AI inline autocomplete
-- Tab to accept is handled in cmp.lua to avoid conflicts
require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = nil,  -- handled in cmp.lua Tab mapping
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  color = {
    suggestion_color = "#585858",  -- subtle ghost text
  },
  log_level = "off",
})
