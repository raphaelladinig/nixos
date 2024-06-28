require("copilot").setup({
  suggestion = {
    keymap = {
      accept = "<C-c>",
      next = "<C-j>",
      prev = "<C-k>",
    },
    auto_trigger = true,
  },
})

local chat = require("CopilotChat")
chat.setup()

vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CopilotChat<cr>")
vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<cr>")
vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>")
