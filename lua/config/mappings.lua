local map = vim.keymap.set

-- simple save
map("n", "<leader>w", "<CMD>w<CR>", { desc = "save the current file" })

-- easy escape
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

-- noh
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>")
