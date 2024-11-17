return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python"
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python") {
					pytest_discover_instances = false,
					-- is_test_file = function()
					-- 	return true
					-- end,
				}
			}
		})
	end
}
