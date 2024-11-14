local my_lsp = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-settings")
-- local my_lsp_addons = require("autoload_plugins.plugin_setting.my_lsp_addons")
local lsp_new =require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-new")

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
			require("mason-lspconfig").setup({
				-- ensure_installed = {'lua'}
        automatic_installation = true,

			})
			require("mason-lspconfig").setup_handlers {
				function(server_name)
					lspconfig[server_name].setup {
						on_attach = my_lsp.on_attach,
						capabilities = my_lsp.capabilities,
					}
				end,
				["ltex"] = my_lsp.ltex,
				["pylsp"] = my_lsp.pylsp,
				-- ["incc"] = my_lsp.incc,
				-- ["incc_py"] = my_lsp.incc_py2,
				["jedi_language_server"] = my_lsp.jedi_language_server,
				-- ["arm_lsp"] =lsp_new.arm_lsp
			}
		end
	}
}
