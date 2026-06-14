return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        suppressed_dirs = { "/", "/tmp", "/home" },
        log_level = "error",
    },
    keys = {
        { "<leader>Ss", "<cmd>SessionSave<CR>", desc = "Save session" },
        { "<leader>Sr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
    },
}
