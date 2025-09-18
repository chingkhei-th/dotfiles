vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<C-e>", function()
    require("mini.files").toggle()
end, { desc = "Toggle mini.files" })

map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help" })
