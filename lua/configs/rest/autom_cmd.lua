
vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

vim.api.nvim_create_user_command('Fold', function()
  vim.opt.foldmethod= "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldcolumn = "0"
  vim.opt.foldtext = ""
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart= 1
  vim.opt.foldnestmax=4
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

