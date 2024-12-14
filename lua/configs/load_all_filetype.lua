local create_autocmd_for_my_filetypes = function(ftype)
	-- vim.api.nvim_create_autocmd("filetype",{
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		pattern = { '*.' .. ftype },
		callback = function()
			require("configs.filetype." .. ftype)
		end
	})
end

create_autocmd_for_my_filetypes("tex")
create_autocmd_for_my_filetypes("py")
create_autocmd_for_my_filetypes("s")
create_autocmd_for_my_filetypes("lua")
create_autocmd_for_my_filetypes("tx")
create_autocmd_for_my_filetypes("puml")
create_autocmd_for_my_filetypes("java")
create_autocmd_for_my_filetypes("http")
create_autocmd_for_my_filetypes("rest_nvim_result")

vim.keymap.set('n', '<leader>`', function()
	fpath = "/Users/dominik/HOME/DEV/Compiler/incc24/dom/arm/compiler.py"
	vim.cmd("!python3 " .. fpath)
end, {})
vim.keymap.set('n', '<leader>io',
	':tabnew /Users/dominik/HOME/DEV/Compiler/incc24/dom/arm/code.tx<CR>gg:e code/<cfile><cr>', {})

require("extra.my_plugins.load_my_plugins")

-- vim.api.nvim_create_autocmd("BufEnter",{
-- 	pattern={"*.tx"},
-- 	callback = function ()
-- 		require("configs.filetype."..'tx')
-- 	end
-- })


require("configs.filetype.all")
