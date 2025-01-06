local T = {}
-- T.ff = function()
-- 	local root_patterns = { ".git", ".clang-format", "pyproject.toml", "setup.py" }
-- 	local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
-- 	vim.print(root_dir)
-- end
T.show = function()
	-- local api = vim.api

	local bnr = vim.fn.bufnr('%')
	local ns_id = vim.api.nvim_create_namespace('demo')
	local line_num = vim.api.nvim_win_get_cursor(0)[1] - 1
	-- local col_num = vim.api.nvim_win_get_cursor(0)[2]
	local col_num = -1

	-- local text = vim.opt_local.winbar
	-- vim.print(text)
	local text = require("jsonpath").get()
	local opts = {
		end_line = 10,
		id = 1,
		-- virt_text = { { require("jsonpath").get(), "IncSearch" } },
		virt_text = { { text, "comment" } },
		-- virt_text_pos = 'eol',
		-- virt_text_pos = 'right_align',
		-- virt_text_pos = 'overlay',
		-- virt_text_win_col = 20,
		virt_lines_above = true
	}

	local mark_id = vim.api.nvim_buf_set_extmark(bnr, ns_id, line_num, col_num, opts)
end

return T
