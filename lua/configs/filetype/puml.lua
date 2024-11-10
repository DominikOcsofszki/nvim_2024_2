
vim.api.nvim_create_user_command('Platex', function()
	-- vim.cmd("!plantuml -tlatex % -o generated && e generated/%:t:r.tex")
	vim.cmd("execute'!plantuml -tlatex % -o generated' | e generated/%:t:r.tex")
end, { nargs = 0 })
vim.api.nvim_create_user_command('P', function()
	vim.cmd("!plantuml % -o generated && open generated/%:t:r.png")
end, { nargs = 0 })

vim.api.nvim_create_user_command('Plast', function()
	vim.cmd("!plantuml # -o generated && open generated/#:t:r.png")
end, { nargs = 0 })

vim.o.cms="'%s"
vim.api.nvim_create_user_command('PE', function()
	-- vim.cmd("!plantuml -tlatex % -o generated && e generated/%:t:r.tex")
	vim.cmd("execute'!plantuml -teps % -o generated' | e generated/%:t:r.eps")
end, { nargs = 0 })

