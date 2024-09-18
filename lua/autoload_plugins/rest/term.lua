
return {
  {'akinsho/toggleterm.nvim', version = "*", config = function ()
    require("toggleterm").setup()
    vim.keymap.set('n', "`r", ':ToggleTerm<cr>i<up><cr>',{})
    vim.keymap.set('n', "``", ':ToggleTerm<cr>',{})
    vim.keymap.set('t', "``", '<c-\\><c-n>:ToggleTerm<cr>',{})
  end}
}
