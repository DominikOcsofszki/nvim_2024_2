
vim.keymap.set('n','<leader>e',':NvimTreeToggle<cr>',{})
vim.keymap.set('n','\\',':w<cr>',{})
vim.keymap.set('n','|',':q<cr>',{})
vim.keymap.set('i','jk','<esc>',{})
vim.keymap.set('i','kj','<esc>',{})

vim.keymap.set('n', '<s-cr>', 'yy:!cat "<C-r>+">>ALL.txt<cr>', {})
-- "test.txt"
