-- LaunchPyright = function()
--   local client_id = vim.lsp.start_client({cmd = {"pyright-langserver", "--stdio"}});
--   vim.lsp.buf_attach_client(0, client_id)
-- end
--
-- vim.cmd([[
--   command! -range LaunchPyright  execute 'lua LaunchPyright()'
-- ]])
--
--


ArmLsp = function()
  local client_id = vim.lsp.start_client({
    cmd = {"~/DEV/months/Okt/.venv/bin/python", "~/DEV/months/Okt/arm-lsp.py"}});
  vim.lsp.buf_attach_client(0, client_id)
end

vim.cmd([[
  command! -range ArmLsp  execute 'lua ArmLsp()'
]])


