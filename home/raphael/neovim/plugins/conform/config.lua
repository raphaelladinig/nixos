require("conform").setup({})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format()
end)
