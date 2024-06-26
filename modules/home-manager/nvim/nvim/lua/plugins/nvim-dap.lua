return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"folke/neodev.nvim",
				"nvim-neotest/nvim-nio",
			},
		},
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
		"jbyuki/one-small-step-for-vimkind",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local mason_dir = vim.fn.stdpath("data") .. "/mason/packages"

		require("nvim-dap-virtual-text").setup({})
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
		dapui.setup()

		require("dap-python").setup(mason_dir .. "/debugpy/venv/bin/python")

		dap.adapters.codelldb = {
			type = "server",
			port = "13000",
			host = "127.0.0.1",
			executable = {
				command = mason_dir .. "/codelldb/codelldb",
				args = { "--port", "13000" },
			},
		}
		dap.configurations.cpp = {
			{
				type = "codelldb",
				request = "launch",
				name = "default",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.adapters.dart = {
			type = "executable",
			command = "dart",
			args = { "debug_adapter" },
		}
		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch dart",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
			{
				type = "flutter",
				request = "launch",
				name = "Launch flutter",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
		}

		dap.adapters.flutter = {
			type = "executable",
			command = "flutter",
			args = { "debug_adapter" },
		}

		dap.adapters.bashdb = {
			type = "executable",
			command = mason_dir .. "/bash-debug-adapter/bash-debug-adapter",
			name = "bashdb",
		}
		dap.configurations.sh = {
			{
				type = "bashdb",
				request = "launch",
				name = "Launch file",
				showDebugOutput = true,
				pathBashdb = mason_dir .. "/bash-debug-adapter/extension/bashdb_dir/bashdb",
				pathBashdbLib = mason_dir .. "/bash-debug-adapter/extension/bashdb_dir",
				trace = true,
				file = "${file}",
				program = "${file}",
				cwd = "${workspaceFolder}",
				pathCat = "cat",
				pathBash = "/bin/bash",
				pathMkfifo = "mkfifo",
				pathPkill = "pkill",
				args = {},
				env = {},
				terminalKind = "integrated",
			},
		}

		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
			},
		}
		dap.adapters.nlua = function(callback, config)
			callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
		end

		local filetypes = {
			codelldb = { "cpp" },
		}
		require("dap.ext.vscode").load_launchjs("./launch.json", filetypes)

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })

		vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<leader>dt", function()
			dapui.toggle()
		end)
		vim.keymap.set("n", "<leader>dr", function()
			dapui.open({ reset = true })
		end)
	end,
}
