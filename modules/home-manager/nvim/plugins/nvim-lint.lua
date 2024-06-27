return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			markdown = { "vale" },
			txt = { "vale" },
		}

		vim.keymap.set("n", "<leader>ln", function()
			lint.try_lint()
		end)
	end,
}
