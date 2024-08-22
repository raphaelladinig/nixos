local neotest = require("neotest")
neotest.setup({})

vim.keymap.set("n", "<leader>tr", function()
  neotest.run.run()
end)

vim.keymap.set("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%"))
end)
