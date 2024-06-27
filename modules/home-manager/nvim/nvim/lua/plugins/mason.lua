return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "lua-language-server",
        "vim-language-server",
        "stylua",
        "clangd",
        "clang-format",
        "codelldb",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "emmet-language-server",
        "typescript-language-server",
        "prettier",
        "pyright",
        "debugpy",
        "black",
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "marksman",
        "vale",
        "texlab",
        "bash-language-server",
        "bash-debug-adapter",
        "beautysh",
        "json-lsp",
        "lemminx",
      },
    })
  end,
}
