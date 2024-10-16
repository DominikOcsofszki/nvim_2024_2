-- --
-- -- -- print("OS Info:\n" .. vim.inspect(vim.loop.os_uname()))
-- -- -- print(vim.loop.os_uname().sysname)
-- -- -- print(vim.uv.os_uname().sysname)
-- --
-- -- x = require("telescope._extensions")
-- -- vim.print(x)
-- --
-- --
-- -- -- Telescope live_grep_args
-- -- -- checkhealth vim.deprecated
-- -- vim.cmd([[
-- -- 			highlight RBP1 guibg=Red ctermbg=red
-- -- 			highlight RBP2 guibg=Yellow ctermbg=yellow
-- -- 			highlight RBP3 guibg=Green ctermbg=green
-- -- 			highlight RBP4 guibg=Blue ctermbg=blue
-- -- 			let g:rainbow_levels = 4
-- -- 			function! RainbowParens(cmdline)
-- -- 			  let ret = []
-- -- 			  let i = 0
-- -- 			  let lvl = 0
-- -- 			  while i < len(a:cmdline)
-- -- 			    if a:cmdline[i] is# '('
-- -- 			      call add(ret, [i, i + 1, 'RBP' .. ((lvl % g:rainbow_levels) + 1)])
-- -- 			      let lvl += 1
-- -- 			    elseif a:cmdline[i] is# ')'
-- -- 			      let lvl -= 1
-- -- 			      call add(ret, [i, i + 1, 'RBP' .. ((lvl % g:rainbow_levels) + 1)])
-- -- 			    endif
-- -- 			    let i += 1
-- -- 			  endwhile
-- -- 			  return ret
-- -- 			endfunction
-- -- 			call input({'prompt':'>','highlight':'RainbowParens'})
-- -- 			]])
--
-- -- inputlist(['Select color:', '1. red',  '2. green', '3. blue'])
--
-- vim.cmd([[			nmap \x :call GetFoo4()<CR>:exe "/" .. Foo<CR>
-- 			function GetFoo4()
-- 			  call inputsave()
-- 			  "let g:Foo = input("enter search pattern: ")
-- 			  let input = inputlist(['Select color:', '1. red',  '2. green', '3. blue'])
-- 			  print(input)
-- 			  call inputrestore()
-- 			endfunction]])
--
--
local options = {
  'Select color:',
  '1. red',
  '2. green',
  '3. blue'
}

-- Show input list and get the user's selection
local choice = vim.fn.inputlist(options)
print(choice)
-- Check the result and handle accordingly
if choice == 1 then
  print("You selected red!")
elseif choice == 2 then
  print("You selected green!")
elseif choice == 3 then
  print("You selected blue!")
else
  print("Invalid choice or selection canceled.")
end
