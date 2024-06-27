return {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					keymap = {
						accept = "<C-c>",
						next = "<C-j>",
						prev = "<C-k>",
					},
                    auto_trigger = true
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		config = function()
            local chat = require("CopilotChat")
            chat.setup()

            vim.keymap.set({"n", "v"}, "<leader>cc", "<cmd>CopilotChat<cr>")
            vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<cr>")
            vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>")
		end,
	},
}
