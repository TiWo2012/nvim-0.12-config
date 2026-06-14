-- =========================
-- Clangd (system install)
-- =========================

vim.lsp.config("clangd", {
    cmd = { "/usr/bin/clangd" },
    filetypes = { "c", "cpp", "cuda", "objc", "objcpp" },
})
vim.lsp.enable("clangd")

-- =========================
-- lua_ls (mason-lspconfig handles enable, lazydev handles library)
-- =========================

vim.lsp.config("lua_ls", {
    filetypes = { "lua" },
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
    root_dir = function(bufnr, on_dir)
        local path = vim.api.nvim_buf_get_name(bufnr)
        if path == "" then
            return
        end
        on_dir(vim.fs.root(bufnr, ".git") or vim.fn.fnamemodify(path, ":h"))
    end,
    settings = {
        Lua = {
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
        },
    },
})
vim.lsp.enable("lua_ls")

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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single",
        focusable = true,
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = "single",
        focusable = true,
    }
)

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
