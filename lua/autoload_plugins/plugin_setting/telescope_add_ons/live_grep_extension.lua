local M = {}
local lga_actions = require("telescope-live-grep-args.actions")


M.live_grep_args = {
	auto_quoting = true, -- enable/disable auto-quoting
	-- define mappings, e.g.
	mappings = {        -- extend mappings
		i = {
			["<C-k>"] = lga_actions.quote_prompt(),
			-- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
			["<leader><leader>"] = lga_actions.quote_prompt({ postfix = "/Users/dominik/HOME/INFO/txt/" }),
			-- freeze the current list and start a fuzzy search in the frozen list
			["<C-space>"] = lga_actions.to_fuzzy_refine,
		},
	},
	-- ... also accepts theme settings, for example:
	-- theme = "dropdown", -- use dropdown theme
	-- theme = { }, -- use own theme spec
	-- layout_config = { mirror = true }, -- mirror preview pane
}

return M
