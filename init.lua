local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme & UI
Plug('rebelot/kanagawa.nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('folke/trouble.nvim')

-- Fuzzy finder (requires plenary)
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.x'})

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- LSP
Plug('neovim/nvim-lspconfig')
Plug('pmizio/typescript-tools.nvim')  -- enhanced TypeScript LSP

-- Completion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')

-- Snippets
Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*'})
Plug('saadparwaiz1/cmp_luasnip')

-- Formatting
Plug('stevearc/conform.nvim')

-- Git
Plug('lewis6991/gitsigns.nvim')

-- Editing helpers
Plug('windwp/nvim-autopairs')
Plug('numToStr/Comment.nvim')

-- AI autocomplete
Plug('supermaven-inc/supermaven-nvim')

vim.call('plug#end')

require("config.common")
require("config.theme")
require("config.vimtree")
require("config.barbar")
require("config.treesitter")
require("config.lsp")
require("config.cmp")
require("config.telescope_cfg")
require("config.conform_cfg")
require("config.extras")
