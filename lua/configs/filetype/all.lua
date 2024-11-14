vim.keymap.set('n', '<leader>hh', function()
	local current_word = vim.fn.expand('<cword>')
	vim.cmd('DevdocsOpenCurrentFloat')
	vim.api.nvim_feedkeys(current_word, 'n', true)
end, {})

vim.api.nvim_create_user_command('Test', function() require("neotest").run.run() end, {})
