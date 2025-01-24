return -- lazy.nvim
{
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull', '.my-latex', 'Marginpar', 'removing' }

		vim.g.vimtex_compiler_latexmk = {
			callback = 1,
			aux_dir = 'out/',
			out_dir = '.',
			continuous = 1,
			executable = 'latexmk',
			hooks = {},
			options = {
				'-interaction=nonstopmode',
				'-file-line-error',
				'-shell-escape',
				'-synctex=1',
				'-verbose',
			}
		}

		vim.g.vimtex_doc_handlers = { 'vimtex#doc#handlers#texdoc' }
		vim.g.tex_flavor = 'latex'
		vim.g.vimtex_view_method = 'skim'
		vim.g.vimtex_view_enabled = 1
		vim.g.vimtex_doc_confirm_single = 0
		vim.g.vimtex_log_verbose = 1
		vim.g.vimtex_quickfix_enabled = 1

		vim.g.vimtex_toc_config = {
			mode = 2,           -- ToC display mode (1: Separate window, 2: Window + location list, etc.).
			fold_enable = 0,    -- Enable/disable folding in the ToC window.
			fold_level_start = -1, -- Starting fold level (-1 indicates same as `tocdepth`).
			hide_line_numbers = 1, -- Hide line numbers in ToC window.
			-- hotkeys_enabled = 0,  -- Enable/disable individual hotkeys for ToC entries.
			hotkeys_enabled = 1, -- Enable/disable individual hotkeys for ToC entries.
			-- hotkeys = "abcdegijklmnopuvxyz",  -- String of keys used for hotkeys.
			hotkeys = "jkfd1290", -- String of keys used for hotkeys.
			hotkeys_leader = ";", -- Leader key for hotkeys (set empty string to disable).
			indent_levels = 1,  -- Indent section levels in ToC window (1 to enable).
			layers = nil,       -- Specify active layers (undefined by default).
			layer_status = {    -- Initial state of the layers (1 for active, 0 for inactive).
				content = 1,
				label = 1,
				todo = 1,
				include = 0
			},
			layer_keys = { -- Hotkeys for enabling/disabling different layers.
				content = "C",
				label = "L",
				todo = "T",
				include = "I"
			},
			-- resize = 0,  -- Automatically resize Vim when index windows are opened.
			resize = 0,      -- Automatically resize Vim when index windows are opened.
			refresh_always = 1, -- Automatically refresh ToC (0 for manual).
			show_help = 0,   -- Display help text at the top of the ToC.
			show_numbers = 1, -- Show section numbers in the ToC.
			-- split_pos = "vert leftabove",  -- Position where index windows should be opened.
			-- split_pos = "vert leftabove",  -- Position where index windows should be opened.
			split_pos = "vert botright", -- Position where index windows should be opened.
			-- split_width = 30,  -- Width of index window for vertical splits.
			tocdepth = 1,             -- Depth of section levels to display in ToC.
			todo_sorted = 1           -- Sort TODOs at the top of the ToC window.
		}
	end,
}
