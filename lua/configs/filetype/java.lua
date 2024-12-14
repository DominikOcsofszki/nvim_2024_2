vim.keymap.set('n', '<leader>r', ':w<cr>:!java %<cr>', {})

-- To activate optiosn uncommend!
-- require("configs.might_break_things.java").setup()

vim.api.nvim_create_user_command('JAVA', function()
	require("configs.might_break_things.java").setup()
end, {})
