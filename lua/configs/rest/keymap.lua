vim.keymap.set('n','<leader>Y',':lua vim.fn.setreg("+", vim.fn.getcwd())',{})

vim.keymap.set({"n","v"}, "<leader>f", require("telescope-live-grep-args.shortcuts").grep_word_under_cursor)

