return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			log_level = vim.log.levels.TRACE,
			formatters_by_ft = {
				java =
						function()
							return {
								exe = 'java',
								args = { '-jar', os.getenv('HOME') .. '/.local/jars/google-java-format.jar', vim.api.nvim_buf_get_name(0) },
								stdin = true
							}
						end
				,
				-- python = { 'ruff_format' },
				-- 	python = function(bufnr)
				-- 		if require("conform").get_formatter_info("ruff_format", bufnr).available then
				-- 			return { "ruff_format" }
				-- 		else
				-- 			return { "isort", "black" }
				-- 		end
				-- 	end,
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},

		})

		-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end

}
