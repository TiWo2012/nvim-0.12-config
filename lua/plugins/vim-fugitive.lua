return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>", { desc = "opens vim fugitve status" })
        vim.keymap.set("n", "<leader>gp", "<CMD>Git push<CR>",
            { desc = "pushes the current repo to the defaultopens vim fugitve status" })
        vim.keymap.set("n", "<leader>gP", "<CMD>Git pull<CR>",
            { desc = "pulls the current repo to the defaultopens vim fugitve status" })
    end
}
