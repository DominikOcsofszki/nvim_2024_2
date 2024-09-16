
vim.api.nvim_create_autocmd("filetype",{
	pattern={"python"},
	callback = function ()
		require("configs.filetype.python")
	end
})



