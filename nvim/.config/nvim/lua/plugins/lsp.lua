return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"jdtls",
					"kotlin-language-server",
					"bash-language-server",
					"beautysh",
					"lua-language-server",
					"stylua",
					"selene",
					"typescript-language-server",
					"eslint-lsp",
					"prettier",
					"hyprls",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.bashls.setup({
				capabiliites = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabiliites = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabiliites = capabilities,
			})
			lspconfig.eslint.setup({
				capabiliites = capabilities,
			})
			lspconfig.hyprls.setup({
				capabiliites = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
