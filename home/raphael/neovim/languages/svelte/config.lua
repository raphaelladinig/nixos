require("conform").setup({
  formatters_by_ft = {
    svelte = { "prettier" },
  },
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.svelte.setup({
  capabilities = capabilities,
})
