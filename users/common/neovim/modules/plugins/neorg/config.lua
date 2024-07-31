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

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "norg",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})
