-- base settings
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

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
