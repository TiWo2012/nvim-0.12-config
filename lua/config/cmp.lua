local cmp = require("cmp")
local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })

cmp.setup({
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
  },

  completion = {
    autocomplete = { "InsertEnter", "TextChanged" },
  },

  window = {
    completion = {
      border = "rounded",
      winhighlight = "NormalFloat:Pmenu,CursorLine:PmenuSel",
    },
    documentation = {
      border = "rounded",
    },
  },
})
