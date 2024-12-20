local dap = require('dap')

dap.adapters.asm = {
  type = 'server',
  port = "${port}",
  executable = {
    -- command = "/Users/dominik/HOME/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
    command = "/Users/dominik/HOME/.local/share/nvim/mason/packages/codelldb/codelldb",
    args = { "--port", "${port}" },
  }
}
local dap = require('dap')
dap.configurations.asm = {
  {
    name = "Launch file",
    type = "asm",
    request = "launch",
    -- program = "${workspaceFolder}/${fileBasenameNoExtension}",
    program = "${relativeFileDirname}/${fileBasenameNoExtension}",
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    -- stopOnEntry = true,
    sourceLanguage = "asm"
  },
}


