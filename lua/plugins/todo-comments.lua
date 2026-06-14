return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = true,
        keywords = {
            FIX = { icon = " ", color = "error" },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning" },
            PERF = { icon = " ", color = "warning" },
            NOTE = { icon = " ", color = "info" },
        },
    },
    keys = {
        {
            "<leader>fT",
            "<cmd>TodoTelescope<CR>",
            desc = "Telescope todo comments",
        },
    },
}
