vim.keymap.set('n', '<leader>r', ':w<cr>:!python3 %<cr>', {buffer=true})



addPyRunner = function(key)
  vim.keymap.set('n', '<leader>' .. key, function()
    local fpath = vim.g["py" .. key]
    print(fpath)
    vim.cmd("!python3 " .. fpath)
  end, {})
  vim.keymap.set('n', '<leader>a' .. key, function()
    vim.g["py" .. key] = vim.fn.expand("%:p")
  end, {})
end
vim.keymap.set('n', '<leader>`', function()
  fpath = "/Users/dominik/HOME/DEV/Compiler/incc24/dom/arm/compiler.py"
  vim.cmd("!python3 " .. fpath)
end, {})

-- addPyRunner('`')
-- addPyRunner('1')
-- addPyRunner('2')
-- addPyRunner('3')
