local telescope = require("telescope")

return
{
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0", },
	},
	config = function()
		require('autoload_plugins.plugin_setting.telescope_add_ons.telescope_keymaps')
		require('telescope').setup {
			extensions = {
				file_browser = require('autoload_plugins.plugin_setting.telescope_add_ons.file_browser').file_browser,
				live_grep_args = require('autoload_plugins.plugin_setting.telescope_add_ons.live_grep_extension').live_grep_args,
			}
		}
	end
}
