local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({})

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

dapui.setup({
  controls = {
    enabled = false,
  },
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 50,
        menu = {
          dap = "[DAP]",
        },
      })(entry, vim_item)

      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = (strings[1] or "") .. " "

      return kind
    end,
    expandable_indicator = false,
  },
})

vim.keymap.set("n", "<leader>dc", function()
  dap.continue()
end)
vim.keymap.set("n", "<leader>db", function()
  dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dn", function()
  dap.step_over()
end)
vim.keymap.set("n", "<leader>di", function()
  dap.step_into()
end)
vim.keymap.set("n", "<leader>do", function()
  dap.step_out()
end)
vim.keymap.set("n", "<leader>da", function()
  dapui.toggle()
end)
vim.keymap.set("n", "<leader>dr", function()
  dapui.open({ reset = true })
end)
