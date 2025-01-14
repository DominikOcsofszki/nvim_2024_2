local LSP_IMPORTS              = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-all-import")

local M                        = {}
local CMD_INCC24               = "/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/SERVER.sh"
-- local CMD_INCC24               = "/private/tmp/TEST/.venv/lib/python3.13/site-packages/incc_lsp/SERVER.sh"
-- local CMD_INSIDE_VSCODE = {"/private/tmp/vscode-python-tools-extension-template/.venv/bin/python", "/Users/dominik/HOME/.vscode/extensions/dominikocsofszki.incc-lsp-2022.0.0-dev/bundled/tool/lsp_server.py"}
local CMD_INSIDE_VSCODE        = { "/private/tmp/vscode-python-tools-extension-template/.venv/bin/python",
	"/private/tmp/vscode-python-tools-extension-template/bundled/tool/lsp_server.py" }

local create_autocmd_ft_incc   = function()
	vim.filetype.add({
		extension = {
			incc = 'incc',
			incc24 = 'incc',
		},
	})
end
local CMD_INCC24               = "/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/SERVER.sh"
-- local CMD_INCC24               = "/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/SERVER_PIPE_PRINT.sh"
-- local CMD_INCC24               = "/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/SERVER_PIPE_BOTH.sh"

local create_incc24_lsp_config = function()
	if not require 'lspconfig.configs'.incc24_lsp then
		require 'lspconfig.configs'.incc24_lsp = {
			default_config = {
				cmd = { CMD_INCC24 },
				-- cmd =  CMD_INSIDE_VSCODE ,
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
