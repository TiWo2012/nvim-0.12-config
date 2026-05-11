-- base settings
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- helper function
local function set_relative()
    vim.opt.relativenumber = true
    vim.opt.number = false
end

local function set_absolute()
    vim.opt.relativenumber = false
    vim.opt.number = true
end

-- autocmds
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = set_absolute,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = set_relative,
})

vim.api.nvim_create_autocmd("FocusLost", {
    callback = set_absolute,
})

vim.api.nvim_create_autocmd("FocusGained", {
    callback = set_relative,
})

-- Use system clipboard for all yank/delete/paste
vim.opt.clipboard = "unnamedplus"

-- tabstop
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.shiftwidth = 4     -- size of an indent
vim.opt.tabstop = 4        -- how many spaces a tab counts for
vim.opt.softtabstop = 4    -- backspace + editing behavior
vim.opt.smartindent = true -- auto-indent new lines

-- Only load this for C or C++ files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        local dap = require("dap")

        -- LLDB adapter (LLVM/Clang)
        dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-vscode', -- adjust path to your system
            name = "lldb"
        }

        -- Helper function to launch a compiled binary
        _G.launch_c_program = function()
            local exe = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            dap.run({
                type = "lldb",
                request = "launch",
                name = "Launch C/C++ Program",
                program = exe,
                cwd = vim.fn.getcwd(),
                stopOnEntry = false,
                args = {},
            })
        end

        -- Optional: Keymap to launch binary (only in C/C++ buffers)
        vim.keymap.set("n", "<F5>", function() _G.launch_c_program() end, { desc = "Launch C/C++ Program (LLDB)" })
    end,
})
