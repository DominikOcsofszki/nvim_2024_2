return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		sync_root_with_cwd = false,
		view = {
			-- number = true,
			-- relativenumber = true,
		},
      -- sort = {
      --   -- sorter = "name",
      --   -- folders_first = true,
      --   -- files_first = false,
      --   sorter = "name",
      --   folders_first = false,
      --   files_first = false,
      -- },
      prefer_startup_root = false,
		renderer = {
			add_trailing = true,
			icons = {
				git_placement = "after",
			},
		},
		update_focused_file = {
			enable = true,
		},
		modified = {
			enable = true,
		},
		filters = {
			dotfiles = true,
			custom = { "Document.tex.latexmain", "Document.synctex.gz", "__init__.py","__pycache__" },
			-- exclude = {""},
		},
		live_filter = {
			always_show_folders = false,
		},
	}
}
