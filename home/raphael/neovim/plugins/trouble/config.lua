require("trouble").setup({})

vim.keymap.set("n", "<leader>xx", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
vim.keymap.set("n", "<leader>xX", "<CMD>Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>xs", "<CMD>Trouble symbols toggle<CR>")
vim.keymap.set("n", "<leader>xl", "<CMD>Trouble lsp toggle win.position=right<CR>")
