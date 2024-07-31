require("toggleterm").setup({})

vim.keymap.set({ "n", "t" }, "<C-a>", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
