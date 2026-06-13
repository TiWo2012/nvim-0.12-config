return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    window = {
      position = "right",
      width = 30,
      mappings = {
        ["<cr>"] = "open_vsplit",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd> Neotree filesystem reveal right<CR>", desc = "open current file in file tree" },
  },
}
