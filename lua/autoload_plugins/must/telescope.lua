return
{
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	init = function()
		require('autoload_plugins.plugin_setting.telescope_settings')
		require('autoload_plugins.plugin_setting.telescope_keymaps')
	end
}
