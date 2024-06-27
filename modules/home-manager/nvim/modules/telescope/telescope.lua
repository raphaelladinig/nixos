require("telescope").setup({
  extensions = {
  	fzf = {
  		fuzzy = true,
  		override_generic_sorter = true,
  		override_file_sorter = true,
  		case_mode = "smart_case",
  	},
  }
})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
