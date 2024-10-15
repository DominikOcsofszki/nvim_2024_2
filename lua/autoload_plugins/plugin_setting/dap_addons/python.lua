


local dap = require('dap')
-- ## WORKING!!!
dap.adapters.python = {
  type = 'executable',
  command = "/Users/dominik/HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
  args = { "-m","debugpy.adapter" },
}
_pythonPath = function()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  else
    return 'python3'
  end
end;
dap.configurations.python = { {
  type = "python",
  request = "launch",
  name = "Launch File",
  pythonPath = _pythonPath,
  cwd = "${workspaceFolder}",
  program = "${fileBasename}"
} }
