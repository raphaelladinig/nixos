require("avante_lib").load()

require("avante").setup({
  provider = "copilot",
})

require("render-markdown").setup({
  file_types = { "markdown", "Avante" },
})
