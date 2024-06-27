local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    python = { "black" },
    java = { "clang-format" },
    sh = { "beautysh" },
    nix = { "nixfmt" },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format()
end)
