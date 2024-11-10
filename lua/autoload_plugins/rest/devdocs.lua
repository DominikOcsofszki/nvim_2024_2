  local win_opts = {
    relative = "editor",
    -- width = vim.o.width,
    -- height = vim.o.height,
    width = math.floor(vim.o.columns ),
    col = math.floor(vim.o.columns ),
    row = math.floor(vim.o.lines),
    style = "minimal",
    border = "rounded",
  }


  -- vim.api.nvim_create_autocmd("BufLeave", {
  --   buffer = buf,
  --   callback = function() vim.api.nvim_win_close(win, true) end
  -- })

return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
		telescope = {},                                -- passed to the telescope picker
		filetypes = {
			-- extends the filetype to docs mappings used by the `DevdocsOpenCurrent` command, the version doesn't have to be specified
			tex = "latex",
			-- javascript = { "node", "javascript" }
		},
		float_win = win_opts,
		-- float_win = { -- passed to nvim_open_win(), see :h api-floatwin
		-- 	relative = "editor",
		-- 	height = 25,
		-- 	width = 200,
		-- 	border = "rounded",
		-- },
		wrap = true,       -- text wrap, only applies to floating window
		-- previewer_cmd = nil, -- for example: "glow"
		previewer_cmd = "glow", -- for example: "glow"
		-- cmd_args = {},      -- example using glow: { "-s", "dark", "-w", "80" }
		cmd_args = { "-s", "dark", "-w", "80" },      -- example using glow: { "-s", "dark", "-w", "80" }
		cmd_ignore = {},    -- ignore cmd rendering for the listed docs
		picker_cmd = false, -- use cmd previewer in picker preview
		picker_cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "50" }
		mappings = {        -- keymaps for the doc buffer
			open_in_browser = ""
		},
		ensure_installed = {'latex'},          -- get automatically installed
		after_open = function(buf)
			  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })

		-- vim.api.nvim_create_autocmd("BufLeave", {
		-- 	buffer = bufnr,
		-- 	callback = function() vim.api.nvim_win_close(bufnr, true) end
		-- })
		end, -- callback that runs after the Devdocs window is opened. Devdocs buffer ID will be passed in

	}
}
