local M = {}


M.SwitchCreateTest = function()
	local file_path = vim.fn.expand("%")

	local test_path = file_path:gsub("src", "tests")
	-- Prepend 'test_' only if not already present
	-- test_path = test_path:gsub("([^/]+%.py)$", function(filename)
	-- 	return filename:find("^test_") and filename or "test_" .. filename
	-- end)
	if test_path == file_path then
		test_path = file_path:gsub("tests", "src")
	end

	vim.cmd("edit " .. test_path)
	local dir_tests = vim.fn.expand("%:p:h")
	if vim.fn.isdirectory(dir_tests) == 0 then
		vim.fn.mkdir(dir_tests)
		-- local content = { "CREATED DIR" }
		-- vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
	end
	vim.cmd('w')
end


M.createTest = function()
	-- Get the current file path
	local file_path = vim.fn.expand("%")

	-- Check if the file is in the 'src/' folder
	if string.match(file_path, "^src/") then
		-- Replace 'src/' with 'tests/'
		local test_path = file_path:gsub("^src/", "tests/")

		-- Prepend 'test_' to the filename
		test_path = test_path:gsub("([^/]+%.py)$", "test_%1")

		-- Print the result (for debugging)
		print("Original Path: " .. file_path)
		print("Test Path: " .. test_path)

		-- Optionally open the test file
		-- vim.cmd("edit " .. test_path)
		vim.cmd("edit " .. test_path)
		local dir_tests = vim.fn.expand("%:p:h")
		if vim.fn.isdirectory(dir_tests) == 0 then
			vim.fn.mkdir(dir_tests)
			-- local content = { "CREATED DIR" }
			-- vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
		end
		vim.cmd('w')
	else
		print("The file is not in the 'src/' folder. No changes made.")
	end
	-- local file_path = vim.fn.expand("%")
	--
	-- local test_path = file_path:gsub("^src/", "tests/")
	-- if test_path == file_path then
	-- 	test_path = file_path:gsub("tests", "src")
	-- end
	--
	--
	-- if string.match(test_path, '^src/') then
	-- 	test_path = test_path:gsub("([^/]+%.py)$", "test_%1")
	-- end
	--
	--
	-- vim.cmd("edit " .. test_path)
	-- local dir_tests = vim.fn.expand("%:p:h")
	-- if vim.fn.isdirectory(dir_tests) == 0 then
	-- 	vim.fn.mkdir(dir_tests)
	-- 	-- local content = { "CREATED DIR" }
	-- 	-- vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
	-- end
	-- vim.cmd('w')
	-- -- Optionally, open or manipulate the new path
	-- -- vim.cmd("edit " .. test_path)
end

M.setup = function()
	vim.api.nvim_create_user_command('TCreate', M.createTest, {})
	vim.api.nvim_create_user_command('TS', M.SwitchCreateTest, {})
end

return M
