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

require("dap-python").setup("python")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" },
}
dap.configurations.cpp = {
  {
    stopOnEntry = false,
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

local filetypes = {
  gdb = { "cpp" },
}
require("dap.ext.vscode").load_launchjs("./launch.json", filetypes)

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })

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
vim.keymap.set("n", "<leader>dt", function()
  dapui.toggle()
end)
vim.keymap.set("n", "<leader>dr", function()
  dapui.open({ reset = true })
end)
