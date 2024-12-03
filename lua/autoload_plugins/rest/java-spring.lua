return {
	'javiorfo/nvim-springtime',
	lazy = true,
	cmd = { "Springtime", "SpringtimeUpdate" },
	dependencies = {
		"javiorfo/nvim-popcorn",
		"javiorfo/nvim-spinetta",
		"hrsh7th/nvim-cmp"
	},
	-- build = function()
	-- 	require 'springtime.core'.update()
	-- end,
	opts = {
		spring = {
			java_version = {
				selected = 2,
				values = { 17, 21, 23 }
			},
			-- Project: Gradle, Gradle Kotlin and Maven (Gradle default)
			project = {
				selected = 3
			},
			-- Language: Java, Kotlin and Groovy (Java default)
			language = {
				selected = 1
			},
			-- Packaging: Jar and War (Jar default)
			packaging = {
				selected = 1
			},
			-- Project Metadata defaults:
			-- Change the default values as you like
			-- This can also be edited in the popup
			project_metadata = {
				group = "io.github.dominikocsofszki",
				artifact = "web-app",
				name = "Web Application",
				package_name = "io.github.dominikocsofszki.webapp",
				version = "0.0.1-SNAPSHOT"
			}
		},

		-- Some popup options
		dialog = {
			-- The keymap used to select radio buttons (normal mode)
			-- selection_keymap = "<C-Space>",
			selection_keymap = "<CR>",

			-- The keymap used to generate the Spring project (normal mode)
			generate_keymap = "<C-CR>",

			-- If you want confirmation before generate the Spring project
			confirmation = true,

			-- Highlight links to Title and sections for changing colors
			style = {
				title_link = "Boolean",
				section_link = "Type"
			}
		},

		-- Workspace is where the generated Spring project will be saved
		workspace = {
			-- Default where Neovim is open
			path = vim.fn.expand("%:p:h"),

			-- Spring Initializr generates a zip file
			-- Decompress the file by default
			decompress = true,

			-- If after generation you want to open the folder
			-- Opens the generated project in Neovim by default
			open_auto = true
		},

		-- This could be enabled for debugging purposes
		-- Generates a springtime.log with debug and errors.
		internal = {
			log_debug = false
		}
	}
}
