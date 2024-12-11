require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "right",
    width = 30,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")
