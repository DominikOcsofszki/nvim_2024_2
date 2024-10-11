local M = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-settings")

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		init = function()
			local lspconfig = require("lspconfig")
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers {
				function(server_name)
					lspconfig[server_name].setup {
						on_attach = M.on_attach,
						capabilities = M.capabilities,
					}
				end,
				["ltex"] = M.ltex,
				["pylsp"] = M.pylsp,
				["incc"] = M.incc,
				["jedi_language_server"] = M.jedi_language_server,
			}
		end
	}
}
