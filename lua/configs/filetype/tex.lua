
vim.keymap.set('n','<leader><leader>',':VimtexTocOpen<cr>',{})

vim.api.nvim_set_keymap('n', '<localleader>q', ':call vimtex#fzf#run()<CR>', { noremap = true, silent = true })
