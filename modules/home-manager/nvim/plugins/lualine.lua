return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "|",
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {},
				lualine_c = {
					"diagnostics",
				},
				lualine_x = {
					"diff",
					"branch",
				},
				lualine_y = {},
				lualine_z = {
					{
						"tabs",
						use_mode_colors = true,
					},
				},
			},
		})
    end,
}
