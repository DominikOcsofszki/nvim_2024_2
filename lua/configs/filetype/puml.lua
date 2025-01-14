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

vim.b.cms = "'%s"


local savePlantuml = function()
	-- local fname_with_ext = vim.fn.expand("%:t")
	-- local fname_no_ext = vim.fn.expand("%:t:r")
	local dir_name = vim.fn.expand("%:h")
	local last_dir = dir_name:match("([^/]+)$") or ''
	-- local fname_solved_md = "./solved/" .. fname_no_ext .. ".md"
	-- vim.cmd('w ' .. dir_name .. "/" .. fname_solved)
	vim.cmd('!plantuml % -o ../img/' .. last_dir)
end

vim.keymap.set('n', '\\', function()
	vim.cmd('w')
	-- vim.cmd('!plantuml % -o ../img ')
	savePlantuml()
end, { buffer = true })
