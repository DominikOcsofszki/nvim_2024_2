
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
-- vim.keymap.set('n', '<leader>r', ' <cmd>w<CR><CMD>!make -f ~/.config/asm_Makefile FILE_PATH=%<CR>', {})
vim.keymap.set('n', "<leader>db", function() vim.cmd("DapToggleBreakpoint") end, {})
vim.keymap.set('n', "<leader>dn", function() vim.cmd("DapNew") end, {})
vim.keymap.set('n', "<c-.>", function() vim.cmd("DapStepInto") end, {})
vim.keymap.set('n', "<c-n>", function() vim.cmd("DapStepOver") end, {})
vim.keymap.set('n', "<c-,>", function() vim.cmd("DapStepOut ") end, {})

vim.keymap.set('v', '<leader>aw', 'y:!echo <c-r>" >> /Users/dominik/HOME/.config/nvim/lua/extra/txt_files/asm/1_important.txt', {})
local dapui = require("dapui")
vim.keymap.set('n','gi', function () dapui.eval() end,{})
vim.keymap.set('n','gh', function () dapui.eval() end,{})

vim.api.nvim_create_user_command('WatchAll',function ()
	dapui.elements.watches.add("sp")
	dapui.elements.watches.add("x20")
	dapui.elements.watches.add("x0")
	dapui.elements.watches.add("x1")
	dapui.elements.watches.add("x2")
	dapui.elements.watches.add("pc")
	dapui.elements.watches.add("fp")
	dapui.elements.watches.add("lr")
	dapui.elements.repl.buffer("lr")
end ,{})

vim.api.nvim_create_user_command('Watch',function (opts)
	for index, arg in ipairs(opts.fargs) do
			dapui.elements.watches.add(arg)
	end
end ,{nargs="+",complete = "command"})

