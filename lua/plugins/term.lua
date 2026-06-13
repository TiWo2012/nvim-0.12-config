return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true,
      autochdir = true,
      start_in_insert = false,

      float = {
        border = "rounded",
      },

      -- make it look nicer
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return "terminal"
        end,
      },
    })

    -- exit terminal mode
    vim.keymap.set('t', '<C-x>', [[<C-\><C-n>]], { noremap = true, silent = true })

    -- keymaps
    vim.keymap.set('n', '<leader>to', '<cmd>ToggleTerm direction=vertical<CR>', { silent = true })
    vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { silent = true })
    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { silent = true })

    -- "buffer" fallback: just toggle the default terminal
    vim.keymap.set('n', '<leader>tb', '<cmd>ToggleTerm direction=tab<CR>', { silent = true })
  end
}
