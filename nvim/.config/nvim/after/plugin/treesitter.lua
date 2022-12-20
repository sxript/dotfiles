require'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust" },

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
  
    highlight = {
        enable = true,
    },
}
