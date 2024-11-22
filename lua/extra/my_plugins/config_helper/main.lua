local M = {}
-- M.popUpFromTextWidthHeight = function(content, width, height)
M.popUPConfigs = function(width, height)
	local buf = vim.api.nvim_create_buf(false, true) -- Create unlisted scratch buffer

	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor(vim.o.columns),
		row = math.floor(vim.o.lines),
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_opts)
	vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })

	-- vim.api.nvim_create_autocmd("BufLeave", {
	-- 	buffer = buf,
	-- 	callback = function() vim.api.nvim_win_close(win, true) end
	-- })
	-- vim.defer_fn(function() vim.cmd("e test.lua") end, 1000)
	vim.cmd("e /Users/dominik/HOME/BA/DEV/extern/InCC-interpreter_ue08/src/incc_interpreter_ue08/LSP/LSP_CONFIGS.py")
	-- vim.cmd("buffer " .. buf)
end

-- M.popUP(100, 50)
M.setup = function()
	vim.api.nvim_create_user_command('CONFS', function()
		M.popUPConfigs(100, 50)
	end, { nargs = 0 })
end

return M
