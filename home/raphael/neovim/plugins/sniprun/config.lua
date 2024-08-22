local sniprun = require("sniprun")

sniprun.setup({
  display = {
    "Classic",
  },

  show_no_output = {
    "Classic",
  },
})

vim.keymap.set({ "n", "v" }, "<leader>r", function()
  sniprun.run()
end)
