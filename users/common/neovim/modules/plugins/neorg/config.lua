require("neorg").setup({
  load = {
    ["core.clipboard.code-blocks"] = {},
    ["core.esupports.hop"] = {},
    ["core.esupports.indent"] = {},
    ["core.esupports.metagen"] = {},
    ["core.itero"] = {},
    ["core.keybinds"] = {},
    ["core.looking-glass"] = {},
    ["core.pivot"] = {},
    ["core.promo"] = {},
    ["core.qol.toc"] = {},
    ["core.qol.todo_items"] = {},
    ["core.tangle"] = {},
    ["core.ui.calendar"] = {},
    ["core.concealer"] = {},
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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.norg" },
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})
