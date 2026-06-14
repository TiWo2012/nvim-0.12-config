-- base settings
vim.opt.hidden = true
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

-- auto-wipe unnamed empty buffer on startup
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_get_name(bufnr) == "" and vim.bo[bufnr].buftype == "" then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end,
})

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

-- highlight trailing whitespace with listchars
vim.opt.list = true
vim.opt.listchars:append { trail = "·" }

-- trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- splits
vim.opt.splitright = true

-- Use system clipboard for all yank/delete/paste
vim.opt.clipboard = "unnamedplus"

-- tabstop
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.shiftwidth = 2     -- size of an indent
vim.opt.tabstop = 2        -- how many spaces a tab counts for
vim.opt.softtabstop = 2    -- backspace + editing behavior
vim.opt.smartindent = true -- auto-indent new lines
