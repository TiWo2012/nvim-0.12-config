local map = vim.keymap.set

-- simple save
map("n", "<leader>w", "<CMD>w<CR>", { desc = "save the current file" })

-- easy escape
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")

-- noh
map("n", "<esc>", "<cmd>noh<CR>")

local function has_makefile()
    return vim.fn.filereadable("Makefile") == 1
        or vim.fn.filereadable("makefile") == 1
        or vim.fn.filereadable("GNUmakefile") == 1
end

if has_makefile() then
    -- =========================
    -- Run
    -- =========================
    vim.api.nvim_create_user_command("Run", function()
        os.execute([[
      tmux send-keys -t :.right C-c;
      sleep 0.1;
      tmux send-keys -t :.right 'make && make run' Enter
    ]])
    end, {})

    -- =========================
    -- Build
    -- =========================
    vim.api.nvim_create_user_command("Build", function()
        os.execute([[
      tmux send-keys -t :.right C-c;
      sleep 0.1;
      tmux send-keys -t :.right 'make' Enter
    ]])
    end, {})

    -- =========================
    -- Auto-build on save
    -- =========================
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.c", "*.cpp" },
        callback = function()
            os.execute("tmux send-keys -t :.right 'make' Enter")
        end,
    })
end

map("n", "gr", "<CMD>IncRename ", { desc = "rename the current identifier" })
