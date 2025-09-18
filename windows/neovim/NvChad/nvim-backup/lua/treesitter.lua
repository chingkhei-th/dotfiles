require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "c", "html", "css", "javascript", "lua", "markdown", "markdown_inline" },
    highlight = { enable = true },
    indent = { enable = true }
})
