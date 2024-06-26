return {
	"mfussenegger/nvim-jdtls",
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
	config = function()
		local jdtls = require("jdtls")
		local mason_dir = vim.fn.stdpath("data") .. "/mason/packages"
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
		local bundles = {
			vim.fn.glob(
				mason_dir
					.. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		}
		vim.list_extend(
			bundles,
			vim.split(vim.fn.glob(mason_dir .. "/java-test/extension/server/*.jar", 1), "\n")
		)

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local on_attach = function(client, bufnr)
			require("jdtls.dap").setup_dap_main_class_configs()
		end

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-javaagent:" .. mason_dir .. "/jdtls/lombok.jar",
				"-jar",
				vim.fn.glob(mason_dir .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				mason_dir .. "/jdtls/config_linux",
				"-data",
				workspace_dir,
			},
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),
			init_options = {
				bundles = bundles,
			},
		}

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "java" },
			callback = function()
				jdtls.start_or_attach(config)
			end,
		})
	end,
}
