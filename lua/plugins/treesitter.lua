return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = { "c", "cpp", "lua", "python", "typescript", "javascript", "rust", "go", "zig" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
