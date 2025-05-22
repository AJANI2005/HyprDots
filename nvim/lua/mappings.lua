require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e","<cmd>NvimTreeToggle<cr>", {desc = "Toggle Nvim Tree"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
