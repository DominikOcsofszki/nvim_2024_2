-- /runtime/lua/man.lua
local x = require('man').goto_tag("zsh",'','')
local show_toc = require('man').show_toc()
local cmd = "e "..x[1].filename
vim.print(cmd)
vim.cmd(cmd)
