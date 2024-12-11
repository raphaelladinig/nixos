require("conform").setup({
  formatters_by_ft = {
    scss = { "prettier" },
  },
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.cssls.setup({
  capabilities = capabilities,
})
