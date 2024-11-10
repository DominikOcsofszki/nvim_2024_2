
vim.api.nvim_create_user_command('Puml', function()
	vim.cmd("!plantuml % -o generated && open  generated/%<.png")
end, { nargs = 0 })
