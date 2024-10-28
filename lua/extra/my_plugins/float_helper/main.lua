local GET = require('extra/my_plugins/float_helper/pop_from_file')
local M = {}
local helper_fun = function()
  vim.api.nvim_create_user_command('Help', function()
    local list = require('extra/my_plugins/float_helper/get').returnHelper()
    GET.show_popup_from_file(list)
  end, { nargs = 0 })
  vim.keymap.set('n', '<leader>h', function()
    vim.cmd('Help')
  end, {})
end
local function select_from_text(item_list)
  local new_list = {}
  for index, value in ipairs(item_list) do
    table.insert(new_list, "" .. index .. ": " .. value)
  end
  local input_index = vim.fn.inputlist(new_list)
  return input_index
end

M.objdump = function()
  local fname = vim.fn.expand("%:p:r")
  local options = { '-h', '-l', '-f', '-d', '-d -j __text' }
  local index = select_from_text(options)
  local cmd = "objdump " .. options[index] .. " " .. fname
  -- vim.print(cmd)

  local output = vim.fn.systemlist(cmd)
  GET.popUpFromTextWidthHeight(output, 80, 80)
end

vim.keymap.set('n', '<leader>ao', function()
  M.objdump()
end, {})

vim.keymap.set('n', '<leader>aa', function()
  M.switch_files()
end, {})

local objdump_fun = function()
  vim.api.nvim_create_user_command('Ob', function(opts)
  local fname = vim.fn.expand("%:p:r")
  local cmd = "objdump " .. opts.args .. " " .. fname
  local output = vim.fn.systemlist(cmd)
  GET.popUpFromTextWidthHeight(output, 80, 80)
  end, { nargs = "+" })
end


-- -- !!!TODO
-- M.switch_files = function()
--   local fname = vim.fn.expand("%:p:r")
--   local options = { '-h', '-l', '-f', '-d', '-d -j __text' }
--   local index = select_from_text(options)
--   local cmd = "objdump " .. options[index] .. " " .. fname
--   local output = vim.fn.systemlist(cmd)
--   GET.popUpFromTextWidthHeight(output, 80, 80)
-- end



M.setup = function()
  helper_fun()
  objdump_fun()
end

return M
