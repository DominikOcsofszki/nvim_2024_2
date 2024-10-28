local M                                         = {}
local lspconfig                           = require("lspconfig")
local util                                = require("lspconfig").util
local _capabilities                       = vim.lsp.protocol.make_client_capabilities()
local capabilities                        = require('cmp_nvim_lsp').default_capabilities(_capabilities)
local on_attach                           = require("autoload_plugins.plugin_setting.my_lsp_addons.utils").on_attach

local basics_attack_capabilities_root_dir = {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	-- root_dir = M.root_dir
}

M.basic_lsp_addons                        = function(NAME, ADDONS)
	lspconfig[NAME].setup(vim.tbl_deep_extend("force", basics_attack_capabilities_root_dir, ADDONS or {}))
end
M.basic_lsp                               = function(NAME)
	M.basic_lsp_addons(NAME)
end

M.arm_lsp                                 = function()
	lspconfig.arm_lsp.setup {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		cmd = { 'python3', '~/DEV/months/Okt/arm-lsp.py' },
		filetypes = { 's', 'asm', 'S' },
		root_dir = function(fname)
			return lspconfig.util.find_git_ancestor(fname)
		end,
	}
end

-- M.incc                                    = function()
--     lspconfig.incc.setup {
--         on_attach = M.on_attach,
--         capabilities = M.capabilities,
--         cmd = { 'node', '/Users/dominikocsofszki/WS24/lsp2/server/out/incc-lsp.js' },
--         filetypes = { 'tx', 'incc' },
--         root_dir = function(fname)
--             return lspconfig.util.find_git_ancestor(fname)
--         end,
--     }
-- end




return M
