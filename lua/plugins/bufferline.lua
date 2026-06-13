return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thin",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      color_icons = true,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
  keys = {
    { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<leader>bd", "<cmd>bd<CR>", desc = "Close buffer" },
  },
}
