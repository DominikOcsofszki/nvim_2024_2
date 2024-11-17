local M = {}
M.popUpFromText = function(content)
	M.popUpFromTextWidthHeight(content, 70, 40)
end
local lst = [[
def test_solution():
    sol = Solution()
    run = sol.fun_XXX_change
    tests = [
        ["XXX", 777],
        ["XXX", 777],
        ["XXX", 777],
    ]
    for test in tests:
        assert run(test[0]) == test[1], test


test_solution()
# @leet end
]]


M.popUpFromTextWidthHeight = function(content, width, height)
	local lines = {}
	for line in lst:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end
	-- for index, line in ipairs(lst) do
	-- 	table.insert(lines, line)
	-- end
	-- vim.print(lines)
	local buf = vim.api.nvim_create_buf(false, true) -- Create unlisted scratch buffer
	-- vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
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
	--   buffer = buf,
	--   callback = function() vim.api.nvim_win_close(win, true) end
	-- })
end
return M
