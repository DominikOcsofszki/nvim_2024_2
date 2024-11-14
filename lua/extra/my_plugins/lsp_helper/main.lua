

local M = {}

M.setup = function ()
	vim.api.nvim_create_user_command('StartLsp',function ()
		M.runLsp()
	end, {nargs=0})
end
M.runLsp = function()
    vim.lsp.start({
      name = 'incc-lsp-py',
      cmd = {'/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3.12', 
			'/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/server2.py',
			-- 'arg1', 'arg2'
		},
      root_dir = vim.fs.root(0, {'setup.py', 'pyproject.toml','.git'}),
    })
	end



M.ff = function()
local f = io.open("/tmp/output.json", "w") if f then f:write(vim.fn.json_encode(vim.lsp.protocol.make_client_capabilities())) f:close() else print("Error: Unable to open file for writing.") end
end
-- M.setup()
return M
