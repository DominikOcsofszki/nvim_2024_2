-- vim.opt.makeprg = './build.sh'
-- vim.opt.makeprg = 'as % && ld -o % %.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64  &&./% '
-- vim.opt.makeprg = 'as % && ld -t -o %< %<.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 && ./%<'
-- vim.opt.makeprg = 'as % && ld -t -o %< %<.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 && %<'
vim.opt.makeprg =
'as % && ld  -o %< %<.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 && ./%<'

-- require('dap').adapters.lldb = {
--     type = 'executable',
--     command = '/usr/bin/lldb-vscode',  -- Change this if `lldb-vscode` is located elsewhere
--     name = "lldb"
-- }
-- require('dap').configurations.lldb = {
--     {
--         name = "Launch",
--         type = "lldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--         args = {},
--     },
-- }
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = 'Error' })

-- cmd('DapShowLog', 'split | e ' .. vim.fn.stdpath('cache') .. '/dap.log | normal! G', {})
-- cmd('DapContinue', function() require('dap').continue() end, { nargs = 0 })
-- cmd('DapToggleBreakpoint', function() require('dap').toggle_breakpoint() end, { nargs = 0 })
-- cmd('DapToggleRepl', function() require('dap.repl').toggle() end, { nargs = 0 })
-- cmd('DapStepOver', function() require('dap').step_over() end, { nargs = 0 })
-- cmd('DapStepInto', function() require('dap').step_into() end, { nargs = 0 })
-- cmd('DapStepOut', function() require('dap').step_out() end, { nargs = 0 })
-- cmd('DapTerminate', function() require('dap').terminate() end, { nargs = 0 })
-- cmd('DapDisconnect', function() require('dap').disconnect({ terminateDebuggee = false }) end, { nargs = 0 })
-- cmd('DapLoadLaunchJSON', function() require('dap.ext.vscode').load_launchjs() end, { nargs = 0 })
-- cmd('DapRestartFrame', function() require('dap').restart_frame() end, { nargs = 0 })




-- vim.keymap.set('t', "<c-s>", '', {})
vim.keymap.set('n', '<leader>r', ' <cmd>w<CR><CMD>!make -f ~/.config/asm_Makefile FILE_PATH=%<CR>', {})
vim.keymap.set('n', "<leader>db", function() vim.cmd("DapToggleBreakpoint") end, {})
vim.keymap.set('n', "<leader>dn", function() vim.cmd("DapNew") end, {})
vim.keymap.set('n', "<c-.>", function() vim.cmd("DapStepInto") end, {})
vim.keymap.set('n', "<c-n>", function() vim.cmd("DapStepOver") end, {})
vim.keymap.set('n', "<c-,>", function() vim.cmd("DapStepOut ") end, {})

