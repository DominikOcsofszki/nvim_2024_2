
local create_autocmd_for_my_filetypes = function (ftype)
vim.api.nvim_create_autocmd("filetype",{
	pattern={ftype},
	callback = function ()
		require("configs.filetype."..ftype)
	end
})
end

create_autocmd_for_my_filetypes("tex")
create_autocmd_for_my_filetypes("python")
create_autocmd_for_my_filetypes("asm")
create_autocmd_for_my_filetypes("lua")


-- vim.api.nvim_create_autocmd("filetype",{
-- 	pattern={"tex"},
-- 	callback = function ()
-- 		require("configs.filetype.tex")
-- 	end
-- })
-- vim.api.nvim_create_autocmd("filetype",{
-- 	pattern={"python"},
-- 	callback = function ()
-- 		require("configs.filetype.python")
-- 	end
-- })
--
