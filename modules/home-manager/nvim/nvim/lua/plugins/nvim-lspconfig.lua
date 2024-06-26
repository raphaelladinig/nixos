return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("neodev").setup({})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.vimls.setup({
			capabilities = capabilities,
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		lspconfig.html.setup({
			capabilities = capabilities,
		})

		lspconfig.emmet_language_server.setup({
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.dartls.setup({
			capabilities = capabilities,
		})

		lspconfig.kotlin_language_server.setup({
			capabilities = capabilities,
		})

		lspconfig.marksman.setup({
			capabilities = capabilities,
		})

		lspconfig.texlab.setup({
			capabilities = capabilities,
		})

		lspconfig.bashls.setup({
			capabilities = capabilities,
		})

        lspconfig.jsonls.setup({
            capabilities = capabilities,
        })

        lspconfig.lemminx.setup({
            capabilities = capabilities,
        })


        lspconfig.nil_ls.setup({
            capabilities = capabilities,
        })
	end,
}
