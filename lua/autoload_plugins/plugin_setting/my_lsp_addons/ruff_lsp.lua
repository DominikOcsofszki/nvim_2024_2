local M = {}
M.ruff_lsp = function()
	require('lspconfig').ruff_lsp.setup({
	})
end
return M
