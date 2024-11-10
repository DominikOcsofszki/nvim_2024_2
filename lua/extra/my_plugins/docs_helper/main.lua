local GET = require('extra/my_plugins/float_helper/pop_from_file')
M = {}


M.setup = function ()
	local home_dir = "/Users/dominik/HOME"
	-- local fname = home_dir.."/.config/nvim/lua/extra/txt_files/99_all.txt"
	local fname = home_dir.."/.config/nvim/lua/extra/txt_files/latex.txt"
				vim.keymap.set('v','<leader>al', ':w>>'..fname)
				vim.keymap.set('n','<leader>al', 'V:w>>'..fname)
				vim.keymap.set('n','<leader>lh', function ()
					GET.show_popup_from_file(fname)
				end,{})
end

return M
