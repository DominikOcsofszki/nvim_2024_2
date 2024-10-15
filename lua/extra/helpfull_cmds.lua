-- local search_name = '*/python.so'
local search_name = 'lua.so'
local files =vim.api.nvim_get_runtime_file('*/' .. search_name, true)
vim.print(files)
-- vim.cmd("e ".. files[1])
-- vim.cmd("e ".. files[2])
