return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      color_icons = true,
      diagnostics = "nvim_lsp",
      numbers = function(opts)
        return string.format("%s", opts.ordinal)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
      hover = {
        enabled = true,
        delay = 100,
        reveal = { "close" },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    local map = vim.keymap.set
    map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
    for i = 1, 9 do
      map("n", "<leader>" .. i, function()
        require("bufferline").go_to(i, true)
      end, { desc = "Go to buffer " .. i })
    end
  end,
}
