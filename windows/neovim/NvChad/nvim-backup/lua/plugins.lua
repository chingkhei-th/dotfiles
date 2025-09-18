-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Telescope
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    section_separators = { left = "", right = "" },
                    component_separators = "|",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" }
                }
            })
        end
    },

    -- File Explorer replacement
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.files").setup()
            vim.keymap.set("n", "<C-e>", MiniFiles.open, { desc = "Toggle file explorer" })
        end,
    },

    -- Dashboard
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                "       ██████╗ ██╗████████╗██╗  ██╗██╗   ██╗██████╗ ",
                "      ██╔═══██╗██║╚══██╔══╝██║  ██║██║   ██║██╔══██╗",
                "      ██║   ██║██║   ██║   ███████║██║   ██║██████╔╝",
                "      ██║▄▄ ██║██║   ██║   ██╔══██║██║   ██║██╔══██╗",
                "      ╚██████╔╝██║   ██║   ██║  ██║╚██████╔╝██║  ██║",
                "       ╚══▀▀═╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝",
            }
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
                dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
                dashboard.button("g", "  Find word", ":Telescope live_grep<CR>"),
                dashboard.button("t", "  Themes", ":Telescope colorscheme<CR>"),
                dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
            }
            dashboard.section.footer.val = "Welcome to Neovim 🚀"
            alpha.setup(dashboard.config)
        end,
    },

    -- Extras
    { "windwp/nvim-autopairs", config = true },
    { "numToStr/Comment.nvim", config = true },

    -- Transparent background
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup()
        end,
    },
})
