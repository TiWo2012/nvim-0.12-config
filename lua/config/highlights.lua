local transparent_groups = { "NormalFloat", "FloatBorder", "Pmenu" }

local function set_transparent()
  for _, hl in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, hl, { bg = "NONE" })
  end
end

set_transparent()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_transparent,
})
