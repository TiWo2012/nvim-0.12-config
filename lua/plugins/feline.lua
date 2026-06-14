return {
	"feline-nvim/feline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local feline = require("feline")

		-- simple color palette (works with most themes)
		local colors = {
			bg = "#1e1e2e",
			fg = "#cdd6f4",
			blue = "#89b4fa",
			green = "#a6e3a1",
			yellow = "#f9e2af",
			red = "#f38ba8",
			mauve = "#cba6f7",
		}

		-- mode colors
		local vi_mode_colors = {
			NORMAL = colors.blue,
			INSERT = colors.green,
			VISUAL = colors.mauve,
			OP = colors.green,
			BLOCK = colors.blue,
			REPLACE = colors.red,
			COMMAND = colors.yellow,
		}

		feline.setup({
			theme = {
				bg = colors.bg,
				fg = colors.fg,
			},
			vi_mode_colors = vi_mode_colors,

			components = {
				active = {
					-- LEFT
					{
						{
							provider = "vi_mode",
							hl = function()
								return {
									bg = require("feline.providers.vi_mode").get_mode_color(),
									fg = colors.bg,
									style = "bold",
								}
							end,
							left_sep = " ",
							right_sep = "",
						},
						{
							provider = {
								name = "file_info",
								opts = {
									file_icon = true,
									type = "relative",
								},
							},
							hl = { fg = colors.fg, bg = colors.bg },
							left_sep = " ",
							right_sep = " ",
						},
						{
							provider = "git_branch",
							hl = { fg = colors.yellow, bg = colors.bg },
							left_sep = "",
							right_sep = " ",
						},
						{
							provider = "lsp_client_names",
							hl = { fg = colors.green, bg = colors.bg },
							left_sep = "",
							right_sep = " ",
						},
					},

					-- MIDDLE
					{
						{
							provider = "",
						},
					},

					-- RIGHT
					{
						{
							provider = function()
								local line = vim.fn.line(".")
								local col = vim.fn.col(".")
								return string.format(" %d:%d ", line, col)
							end,
							hl = { fg = colors.bg, bg = colors.blue, style = "bold" },
							left_sep = "",
							right_sep = " ",
						},
					},
				},
			},
		})

		-- feline.winbar.setup()
	end,
}
