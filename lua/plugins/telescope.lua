return
{
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	init = function()
		require('plugin_setting.telescope_settings')
	end
}
