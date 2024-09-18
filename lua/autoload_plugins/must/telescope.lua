local telescope = require("telescope")

return
{
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0", },
	},
	init = function()
		extensions = {
			require('autoload_plugins.plugin_setting.telescope_add_ons.file_browser'),
			require(
				'autoload_plugins.plugin_setting.telescope_add_ons.live_grep_extension'),
		}
		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")

		require('autoload_plugins.plugin_setting.telescope_keymaps')
	end
}
