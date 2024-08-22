require("conform").setup({
  formatters_by_ft = {
    csharp = { "csharpier" },
  },
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.csharp_ls.setup({
  capabilities = capabilities,
})
