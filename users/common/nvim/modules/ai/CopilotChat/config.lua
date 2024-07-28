local chat = require("CopilotChat")
chat.setup()

vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CopilotChat<cr>")
vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<cr>")
vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>")
