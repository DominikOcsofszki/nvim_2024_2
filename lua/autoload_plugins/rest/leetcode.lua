return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		-- lazy.nvim
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lang = "python3",
		storage = {
			home = "/Users/dominik/HOME/DEV/LEETCODE/src" .. "/leetcode",
			cache = vim.fn.stdpath("cache") .. "/leetcode",
		},
		---@type table<lc.lang, lc.inject>
		injector = {
			["python3"] = {
				before = true
			},
			-- hooks = {
			-- 	---@type fun()[]
			-- 	["enter"] = {},
			--
			-- 	---@type fun(question: lc.ui.Question)[]
			-- 	["question_enter"] = {
			-- 		function(question)
			-- 		end },
			--
			-- 	---@type fun()[]
			-- 	["leave"] = {},
			-- },
		}
		-- 		injector = { ---@type table<lc.lang, lc.inject>
		--     ["python3"] = {
		--         before = true
		--     },
		--     ["cpp"] = {
		--         before = { "#include <bits/stdc++.h>", "using namespace std;" },
		--         after = "int main() {}",
		--     },
		--     ["java"] = {
		--         before = "import java.util.*;",
		--     },
		-- }

		-- hooks = {
		-- 	---@type fun()[]
		-- 	["enter"] = {},
		--
		-- 	---@type fun(question: lc.ui.Question)[]
		-- 	["question_enter"] = {},
		--
		-- 	---@type fun()[]
		-- 	["leave"] = {},
		-- },

	},
}
