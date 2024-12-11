require("conform").setup({
  formatters_by_ft = {
    typst = { "typstyle" },
  },
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.tinymist.setup({
  capabilities = capabilities,
  offset_encoding = "utf-8",
  root_dir = vim.fn.getcwd(),
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "typst",
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
})
