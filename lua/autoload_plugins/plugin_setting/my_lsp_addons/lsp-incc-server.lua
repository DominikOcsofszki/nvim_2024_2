local LSP_IMPORTS              = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-all-import")

local M                        = {}
local CMD_INCC24               = "/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/SERVER.sh"

local create_autocmd_ft_incc   = function()
	vim.filetype.add({
		extension = {
			incc = 'incc',
			incc24 = 'incc',
		},
	})
end
local create_incc24_lsp_config = function()
	if not require 'lspconfig.configs'.incc24_lsp then
		require 'lspconfig.configs'.incc24_lsp = {
			default_config = {
				cmd = { CMD_INCC24 },
				filetypes = { 'tx', 'incc', 'incc24' },
				root_dir = function(fname)
					return require 'lspconfig'.util.find_git_ancestor(fname)
				end,
				settings = {},
				on_attach = LSP_IMPORTS.ON_ATTACH,
				capabilities = LSP_IMPORTS.CAPABILITIES,
			},
		}
	end
	require("lspconfig").incc24_lsp.setup {}
end


M.setup = function()
	create_autocmd_ft_incc()
	create_incc24_lsp_config()
end
return M
