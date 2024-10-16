

M={}
M.setup = function ()
  vim.api.nvim_create_user_command('Help', function()
    local list  =require('extra/my_plugins/float_helper/get').returnHelper()
    require('extra/my_plugins/float_helper/pop_from_file').show_popup_from_file(list)
  end, { nargs = 0 })
  vim.keymap.set('n','<leader>h',function ()
    vim.cmd('Help')
  end,{})
end
return M
