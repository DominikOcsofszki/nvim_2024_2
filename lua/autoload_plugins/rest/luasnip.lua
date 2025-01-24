function deacticateJumpToSnipAfterEsc()
	-- https://github.com/L3MON4D3/LuaSnip/issues/258
	vim.api.nvim_create_autocmd('ModeChanged', {
		pattern = '*',
		callback = function()
			if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
					and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
					and not require('luasnip').session.jump_active
			then
				require('luasnip').unlink_current()
			end
		end
	})
end

return -- Snippet Courtesy of @Zeioth,

{
	"L3MON4D3/LuaSnip",
	build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"benfowler/telescope-luasnip.nvim",
	},
	config = function(_, opts)
		if opts then require("luasnip").config.setup(opts) end
		vim.tbl_map(
			function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
			{ "vscode", "snipmate", "lua" }
		)
		-- friendly-snippets - enable standardized comments snippets
		require("luasnip").filetype_extend("typescript", { "tsdoc" })
		require("luasnip").filetype_extend("javascript", { "jsdoc" })
		require("luasnip").filetype_extend("lua", { "luadoc" })
		require("luasnip").filetype_extend("python", { "pydoc" })
		require("luasnip").filetype_extend("java", { "javadoc" })
		require("luasnip").filetype_extend("sh", { "shelldoc" })
		require("luasnip.loaders.from_vscode").load({ paths = { vim.fn.stdpath("config") .. "/files/LuaSnip/" } })
		require("autoload_plugins.rest.luasnippets.all_snippets").addLuaSnip()
		deacticateJumpToSnipAfterEsc()
	end,
}
