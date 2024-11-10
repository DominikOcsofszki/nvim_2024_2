
vim.keymap.set('n', 'h', ':DevdocsOpenCurrentFloat<cr><C-R><C-W>' , {})
vim.keymap.set('n', 'h', function()
  local current_word = vim.fn.expand('<cword>')
	vim.cmd('DevdocsOpenCurrentFloat')
  vim.api.nvim_feedkeys( current_word, 'n', true)
end, {})
