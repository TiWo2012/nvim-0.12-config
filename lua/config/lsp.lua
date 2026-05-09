-- =========================
-- Mason + LSP setup
-- =========================

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
		"pyright",
		"ts_ls",
	},
	automatic_enable = true,
})

-- =========================
-- Diagnostics UI
-- =========================

local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

-- =========================
-- Floating LSP UI
-- =========================

vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
	    border = "rounded",
    })

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
	    border = "rounded",
    })

-- =========================
-- Keymaps
-- =========================

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

-- =========================
-- LSP capabilities (IMPORTANT for auto-import)
-- =========================

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Extend for proper auto-import + resolved edits
capabilities = vim.tbl_deep_extend("force", capabilities, {
	textDocument = {
		completion = {
			completionItem = {
				snippetSupport = true,
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			},
		},
	},
})

-- Apply globally
vim.lsp.config("*", {
	capabilities = capabilities,
})

-- autosave

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		vim.lsp.buf.format({
			bufnr = args.buf,
			timeout_ms = 2000,
		})
	end,
})
