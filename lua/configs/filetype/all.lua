-- vim.keymap.set('n', '<leader>hh', function()
-- 	local current_word = vim.fn.expand('<cword>')
-- 	vim.cmd('DevdocsOpenCurrentFloat')
-- 	vim.api.nvim_feedkeys(current_word, 'n', true)
-- end, {})

vim.api.nvim_create_user_command('Test', function() require("neotest").run.run() end, {})
vim.api.nvim_create_user_command('TT', function() require("neotest").summary.toggle() end, {})
vim.api.nvim_create_user_command('TW', function() require("neotest").watch.watch() end, {})
vim.api.nvim_create_user_command('TWA', function() require("neotest").watch.toggle(vim.fn.expand("%")) end, {})


vim.api.nvim_create_user_command('JQ', function()
	vim.cmd('set ma')
	vim.cmd('.!jq .')
	vim.cmd('set ft=json')
end
, {})
