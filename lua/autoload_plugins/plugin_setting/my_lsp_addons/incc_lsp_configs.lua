-- ---@param filetypes vim.filetype.add.filetypes A table containing new filetype maps (see example).
-- function M.add(filetypes)
--   for k, v in pairs(filetypes.extension or {}) do
--     extension[k] = v
--   end
--
--   for k, v in pairs(filetypes.filename or {}) do
--     filename[normalize_path(k)] = v
--   end
--
--   for k, v in pairs(filetypes.pattern or {}) do
--     pattern[normalize_path(k, true)] = v
--   end
--
--   if filetypes.pattern then
--     pattern_sorted = sort_by_priority(pattern)
--   end
-- end
--
-- THIS IS IMPORTED INTO
-- autoload_plugins/must/lsp.lua
-- ADDING NEW SERVERS                                    *lspconfig-new*
--
-- The steps for adding and enabling a new server configuration are:
--
-- 1. Define the configuration (see also |vim.fs.root()|): >lua
--    local lspconfig = require 'lspconfig'
--    local configs = require 'lspconfig.configs'
--
--    -- Check if the config is already defined (useful when reloading this file)
--    if not configs.foo_lsp then
--      configs.foo_lsp = {
--        default_config = {
--          cmd = {'/home/neovim/lua-language-server/run.sh'},
--          filetypes = {'lua'},
--          root_dir = function(fname)
--            return lspconfig.util.find_git_ancestor(fname)
--          end,
--          settings = {},
--        },
--      }
--    end
--
-- 2. Call `setup()` to enable the FileType autocmd >
--    lspconfig.foo_lsp.setup{}
--
local M                          = {}

local lspconfig                  = require 'lspconfig'
local lspconfig_configs          = require 'lspconfig.configs'
-- TODO: Create filetype?
local INCC24_LSP_PYTHON_WITH_ENV = '/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3.12'
local INCC24_LSP_LSP_SERVER      = '/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/main.py'

-- local _capabilities              = vim.lsp.protocol.make_client_capabilities()
local capabilities               = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
	.make_client_capabilities())
local on_attach                  = require("autoload_plugins.plugin_setting.my_lsp_addons.utils").on_attach

local create_incc24_lsp_config   = function()
	if not lspconfig_configs.incc24_lsp then
		lspconfig_configs.incc24_lsp = {
			default_config = {
				cmd = { INCC24_LSP_PYTHON_WITH_ENV, INCC24_LSP_LSP_SERVER },
				filetypes = { 'tx', 'incc', 'incc24' },
				root_dir = function(fname)
					return lspconfig.util.find_git_ancestor(fname)
				end,
				settings = {},
				on_attach = on_attach,
				capabilities = capabilities,
			},
		}
	end
	require("lspconfig").incc24_lsp.setup {}
end

local create_autocmd_ft_incc     = function()
	vim.filetype.add({
		extension = {
			incc = 'incc',
			incc24 = 'incc',
		},
	})
end

-- local incc24_lsp                 = function()
-- 	require("lspconfig").incc24_lsp.setup {
-- 		-- on_attach = on_attach,
-- 		-- capabilities = capabilities,
-- 		-- cmd = { INCC24_LSP_PYTHON_WITH_ENV, INCC24_LSP_LSP_SERVER },
-- 		-- filetypes = { 'tx', 'incc', 'incc24' },
-- 		-- root_dir = function(fname)
-- 		-- 	return require("lspconfig").util.find_git_ancestor(fname)
-- 		-- end,
-- 	}
-- end
M.setup                          = function()
	create_autocmd_ft_incc()
	create_incc24_lsp_config()
	-- vim.print("incc_lsp_configs.lua loaded")
	-- incc24_lsp()
end
-- M.setup()
return M
