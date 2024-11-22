-- vim.keymap.set('n', '<leader>r', ':w<cr>:!python3 %<cr>', { buffer = true })
vim.keymap.set('n', '<leader>r', ':w<cr>:!python3 %<cr>', {})
vim.keymap.set('n', '<leader>1', function() vim.cmd('!pdm run t1 ') end, {})
vim.keymap.set('n', '<leader>2', function() vim.cmd('!pdm run t2 ') end, {})
vim.keymap.set('n', '<leader>3', function() vim.cmd('!pdm run t3 ') end, {})
vim.keymap.set('n', '<leader>4', function() vim.cmd('!pdm run t4 ') end, {})
vim.keymap.set('n', '<leader>5', function() vim.cmd('!pdm run t5 ') end, {})
vim.keymap.set('n', '<leader>6', function() vim.cmd('!pdm run t6 ') end, {})
vim.keymap.set('n', '<leader>7', function() vim.cmd('!pdm run t7 ') end, {})



local addPyRunner = function(key)
	vim.keymap.set('n', '<leader>' .. key, function()
		local fpath = vim.g["py" .. key]
		print(fpath)
		vim.cmd("!python3 " .. fpath)
	end, {})
	vim.keymap.set('n', '<leader>a' .. key, function()
		vim.g["py" .. key] = vim.fn.expand("%:p")
	end, {})
end
vim.keymap.set('n', '<leader>`', function()
	fpath = "/Users/dominik/HOME/DEV/Compiler/incc24/dom/arm/compiler.py"
	vim.cmd("!python3 " .. fpath)
end, { buffer = true })

-- addPyRunner('`')
-- addPyRunner('1')
-- addPyRunner('2')
-- addPyRunner('3')
