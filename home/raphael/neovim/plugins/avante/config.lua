vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("avante_lib").load()
    require("avante").setup({
      provider = "copilot",
      hints = { enabled = false },
    })
  end,
})

require("render-markdown").setup({
  file_types = { "markdown", "Avante" },
})
