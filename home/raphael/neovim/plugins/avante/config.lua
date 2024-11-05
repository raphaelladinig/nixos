require("avante_lib").load()

require("avante").setup({
  provider = "copilot",
  hints = { enabled = false },
})

require("render-markdown").setup({
  file_types = { "markdown", "Avante" },
})
