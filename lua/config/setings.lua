-- base settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- helper function
local function set_relative()
	vim.opt.relativenumber = true
end

local function set_absolute()
	vim.opt.relativenumber = false
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
