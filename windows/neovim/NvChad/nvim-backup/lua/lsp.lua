require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "clangd",
        "html",
        "cssls",
        "ts_ls", -- updated from tsserver
        "marksman"
    }
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "pyright", "clangd", "html", "cssls", "ts_ls", "marksman" }
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities
    })
end

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
