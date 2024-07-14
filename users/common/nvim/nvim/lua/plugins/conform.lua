return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang-format" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = { "prettierd" },
        python = { "black" },
        sh = { "beautysh" },
        nix = { "nixfmt" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format()
    end)
  end,
}
