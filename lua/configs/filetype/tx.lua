vim.keymap.set('n', '<leader>r', ":!python3 /Users/dominik/HOME/DEV/Compiler/incc24/dom/arm/compiler.py<CR>", {buffer=true})
vim.cmd("set ft=incc")
vim.cmd("set cms=#%s")

vim.keymap.set('n', '<leader>ic', function() vim.cmd("e code/<cfile>") end, {buffer=true})
vim.keymap.set('n', '<leader>ia', function() vim.cmd("e generated/<cfile>:r.s") end, {buffer=true})
vim.keymap.set('n', '<leader>ii', function() vim.cmd("e generated/ir_code/<cfile>:r.ir") end, {buffer=true})
vim.keymap.set('n', '<leader>i1', ':m0<cr>:w<CR>', {buffer=true})


local switcher_code = function()
  local froot_name = vim.fn.expand("%:t:r")
  local ftype = vim.fn.expand("%:e")
  local cmd
  vim.print(ftype)
  if ftype == "incc" then
     cmd = "e generated/" .. froot_name .. ".s"
  elseif ftype == "s" then
     cmd = "e generated/ir_code/" .. froot_name .. ".ir"
  elseif ftype == "ir" then
     cmd = "e code/" .. froot_name .. ".incc"
  end
  vim.print(":"..cmd)
  vim.cmd(cmd)
end
vim.keymap.set('n', '<leader>is', switcher_code, {})
