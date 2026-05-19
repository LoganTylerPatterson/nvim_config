
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
    "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", 
    "html", "css", "json", "yaml", "markdown", "bash" 
  },
	highlight = {enable = true },
	incremental_selection={enable=true},
	textobjects = {enable=true},
}
