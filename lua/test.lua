local T = {}
T.ff = function()
	local root_patterns = { ".git", ".clang-format", "pyproject.toml", "setup.py" }
	local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
	vim.print(root_dir)
end
return T
