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
--

vim.keymap.set('n', '<leader>r', ' <cmd>w<CR><CMD> !make -C %:p:h -f ~/.config/asm_Makefile  FILE_PATH=%:t <CR>', {buffer=true})
