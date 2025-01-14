local telescope_builtin = require('telescope.builtin')

return {
	vim.keymap.set('n', '<leader>sg', ':Telescope live_grep<CR> ', {}),
	vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, {}),
	vim.keymap.set('n', '<leader>ss', ':Telescope<CR>', {}),
	vim.keymap.set("n", "<leader>so", telescope_builtin.oldfiles, { desc = "[?] Find recently opened files" }),
	vim.keymap.set("n", "<leader>s<space>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" }),
	vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "[S]earch [F]iles" }),
	vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" }),
	vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" }),
	-- vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" }),
	vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" }),
	vim.keymap.set("n", "<leader>sp", telescope_builtin.spell_suggest, { desc = "[S][P]ell suggestion" }),
	vim.keymap.set("n", "<leader>sk", telescope_builtin.keymaps, { desc = "[S]earch [K]eymaps" }),
	vim.keymap.set("n", "<leader>sc", telescope_builtin.git_commits, { desc = "[S]earch git [C]ommits" }),
	vim.keymap.set("n", '<leader>sd', telescope_builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' }),
	vim.keymap.set("n", '<leader>sws', telescope_builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' }),
	-- vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { desc = "[G]oto [R]eferences" }),
	-- vim.keymap.set("n", "gI", telescope_builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' }),

	vim.keymap.set("n", "<leader>/", function()
		telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown { previewer = false, sorting_strategy = "ascending", })
	end, { desc = "[/] Fuzzily search in current buffer]" }),

	vim.keymap.set("n", "<leader>gf", telescope_builtin.git_files, { desc = "Search [G]it [F]iles" }),
	-- vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" }),
	vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
		{ desc = "[S]earch by [G]rep [ARGS]" }),
	vim.keymap.set("n", "<leader>shh",
		":lua require('telescope').extensions.live_grep_args.live_grep_args({hidden=true})<CR>",
		{ desc = "live grep hidden" }),

}
