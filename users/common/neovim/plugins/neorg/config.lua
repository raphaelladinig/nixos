require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {
      config = {
        folds = false,
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
  },
})

require("cmp").setup.filetype("norg", {
  sources = {
    { name = "neorg" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 50,
        menu = {
          neorg = "[Neorg]",
          luasnip = "[LuaSnip]",
          buffer = "[Buffer]",
          path = "[Path]",
        },
      })(entry, vim_item)

      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = (strings[1] or "") .. " "

      return kind
    end,
    expandable_indicator = false,
  },
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "norg",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

vim.keymap.set("n", "<leader>N", "<CMD>Neorg index<CR>")
