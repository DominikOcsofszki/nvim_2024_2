local my_lsp = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-settings")
-- local my_lsp_addons = require("autoload_plugins.plugin_setting.my_lsp_addons")
local lsp_new = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-new")
local DEACTIVATE_BASEPYRIGHT = true
local DEACTIVATE_PYLSP = false

local deactivate_py_tools = function(server_name)
	return (
		(server_name == "basedpyright" and DEACTIVATE_BASEPYRIGHT) or
		(server_name == "pylsp") and DEACTIVATE_PYLSP)
end
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
					-- vim.print(server_name)
					if deactivate_py_tools(server_name) then
						return
					end
					lspconfig[server_name].setup {
						on_attach = my_lsp.on_attach,
						capabilities = my_lsp.capabilities,
					}
				end,
				["ltex"] = my_lsp.ltex,
				["pylsp"] = function(server_name)
					if deactivate_py_tools(server_name) then
						return my_lsp.pylsp
					end
				end,
				-- ["pylsp"] = my_lsp.pylsp,
				-- ["incc"] = my_lsp.incc,
				-- ["incc_py"] = my_lsp.incc_py2,
				["jedi_language_server"] = my_lsp.jedi_language_server,
				-- ["arm_lsp"] =lsp_new.arm_lsp
				-- ["lua_ls"] = my_lsp.lua_ls,
				-- ["incc24_lsp"] = require("autoload_plugins/plugin_setting/my_lsp_addons/incc_lsp_configs").incc24_lsp
			}
			require("autoload_plugins/plugin_setting/my_lsp_addons/incc_lsp_configs").setup()
		end
	}
}
