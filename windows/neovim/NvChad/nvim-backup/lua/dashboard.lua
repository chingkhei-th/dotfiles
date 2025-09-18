local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- GitHub ASCII logo
dashboard.section.header.val = {
    "       ██████╗ ██╗████████╗██╗  ██╗██╗   ██╗██████╗ ",
    "      ██╔═══██╗██║╚══██╔══╝██║  ██║██║   ██║██╔══██╗",
    "      ██║   ██║██║   ██║   ███████║██║   ██║██████╔╝",
    "      ██║▄▄ ██║██║   ██║   ██╔══██║██║   ██║██╔══██╗",
    "      ╚██████╔╝██║   ██║   ██║  ██║╚██████╔╝██║  ██║",
    "       ╚══▀▀═╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝",
}

-- Menu
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("g", "  Find word", ":Telescope live_grep<CR>"),
    dashboard.button("t", "  Themes", ":Telescope colorscheme<CR>"),
    dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
}

dashboard.section.footer.val = "Welcome to Neovim 🚀"

alpha.setup(dashboard.config)
