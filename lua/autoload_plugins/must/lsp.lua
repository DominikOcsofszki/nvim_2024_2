local M = require("autoload_plugins.plugin_setting.lsp-settings")

return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		init = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup_handlers {
				function(server_name)
					lspconfig[server_name].setup {
						on_attach = M.on_attach,
						capabilities = M.capabilities,
					}
				end,
				["ltex"]=M.ltex
			}
		end
	}
}
