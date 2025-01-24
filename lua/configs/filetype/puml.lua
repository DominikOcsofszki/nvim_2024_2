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

vim.api.nvim_create_user_command('PE', function()
	-- vim.cmd("!plantuml -tlatex % -o generated && e generated/%:t:r.tex")
	vim.cmd("execute'!plantuml -teps % -o generated' | e generated/%:t:r.eps")
end, { nargs = 0 })


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = '*.puml', command = "set cms='%s"
})


local savePlantumlLatex = function()
	local dir_name = vim.fn.expand("%:h")
	local last_dir = dir_name:match("([^/]+)$") or ''
	vim.cmd('!plantuml -teps % -o ../img/' .. last_dir)
end

vim.keymap.set('n', '\\', function()
	vim.cmd('w')
	-- vim.cmd('!plantuml % -o ../img ')
	savePlantumlLatex()
end, { buffer = true })
