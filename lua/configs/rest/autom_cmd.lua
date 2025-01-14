vim.api.nvim_create_user_command('Redir', function(ctx)
	local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
	vim.cmd('new')
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

vim.api.nvim_create_user_command('Fold', function()
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.opt.foldcolumn = "0"
	vim.opt.foldtext = ""
	vim.opt.foldlevel = 99
	vim.opt.foldlevelstart = 1
	vim.opt.foldnestmax = 4
end, { nargs = 0 })

-- local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
-- vim.api.nvim_create_autocmd(
-- 	"BufReadPost",
-- 	{callback = function()
-- 			local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
-- 			if {row, col} ~= {0, 0} then
-- 				vim.api.nvim_win_set_cursor(0, {row, 0})
-- 			end
-- 		end,
-- 	group = group
-- 	}
-- )
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--     command = "normal! g'\"zz"
-- })

vim.api.nvim_create_user_command('LR', function()
	vim.cmd("Leet random difficulty=easy ")
end, { nargs = 0 })
vim.api.nvim_create_user_command('LE', function()
	vim.cmd("Leet list difficulty=easy")
end, { nargs = 0 })

vim.api.nvim_create_user_command('SAVE', function()
	local fname_with_ext = vim.fn.expand("%:t")
	local fname_no_ext = vim.fn.expand("%:t:r")
	local dir_name = vim.fn.expand("%:h")
	local fname_solved = "./solved/" .. fname_with_ext
	local fname_solved_md = "./solved/" .. fname_no_ext .. ".md"
	-- vim.cmd('w ' .. dir_name .. "/" .. fname_solved)
	vim.cmd('w ' .. dir_name .. "/" .. fname_solved_md)
	-- vim.cmd('e ' .. dir_name .. "/" .. fname_solved_md)
	-- vim.cmd('w ' .. fname_solved_txt)
end, { nargs = 0 })

vim.api.nvim_create_user_command('ECHO', function()
	local fname_no_ext = vim.fn.expand("%:t:r")
	local dir_name = vim.fn.expand("%:h")
	-- vim.print(dir_name)
	local fname_solved_md = "solved/" .. fname_no_ext .. ".md"
	local full_name = dir_name .. "/" .. fname_solved_md .. ""
	-- vim.cmd('w >> "' .. dir_name .. "/" .. fname_solved_md .. '"')
	-- vim.cmd("w >> " .. dir_name .. "" .. fname_solved_md .. "")
	vim.cmd("e " .. full_name .. "")
	vim.cmd('w')
	-- vim.cmd('w >> "' .. fname_solved_md)
end, { nargs = 0 })
vim.api.nvim_create_user_command('Jrun', function()
	local fname = vim.fn.expand("%")
	vim.cmd('!javac -d target/classes src/main/java/**/*.java && java -cp target/classes ' .. fname)
end, { nargs = 0 })
