local M = {}
M.addLuaSnip = function()
	require "autoload_plugins.rest.luasnippets.tex_snippets".addAllTexLuaSnip()
end
return M
