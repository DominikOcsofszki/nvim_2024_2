local LSP_IMPORTS = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-all-import")
local M           = {}



M.ltex = function()
	local path_spelling = vim.fn.stdpath("config") .. "/files/spell-de.utf-8"
	vim.keymap.set('n', '<leader>aw', ':!echo <c-r><c-w> >> ' .. path_spelling, {})
	-- vim.keymap.set('n', '<leader>aw', ':!echo <c-r><c-w> >> /Users/dominik/home/.config/nvim/files/spell-de.utf-8', {})
	vim.keymap.set('v', '<leader>aw', 'y:!echo <c-r>" >> ' .. path_spelling, {})
	-- vim.keymap.set('v', '<leader>aw', 'y:!echo <c-r>" >> /Users/dominik/home/.config/nvim/files/spell-de.utf-8', {})

	local spell_de = {}
	for word in io.open(path_spelling, "r"):lines() do
		table.insert(spell_de, word)
	end

	require("lspconfig").ltex.setup {
		capabilities = LSP_IMPORTS.capabilities,
		on_attach = LSP_IMPORTS.on_attach,
		filetypes = { 'tex' },
		settings = {
			ltex = {
				language = "de-DE",
				dictionary = {
					['de-DE'] = spell_de
				}
			},
		},
	}
end
return M
