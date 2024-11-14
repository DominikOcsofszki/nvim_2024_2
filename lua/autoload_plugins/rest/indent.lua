return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local h3 = function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF8A95" }) -- Even brighter red
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFE38C" }) -- Even brighter yellow
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#8CD6FF" }) -- Even brighter blue
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#F5B894" }) -- Even brighter orange
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#BBFFA2" }) -- Even brighter green
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#EB9AFF" }) -- Even brighter violet
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#7FE2F0" }) -- Even brighter cyan
		end

		local h2 = function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF7A85" }) -- Brighter red
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFD080" }) -- Brighter yellow
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#72CFFF" }) -- Brighter blue
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#E5AB7D" }) -- Brighter orange
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A8E58B" }) -- Brighter green
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#DA89FF" }) -- Brighter violet
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#68D0E0" }) -- Brighter cyan
		end

		local h2 = function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
		end

		local h4 = function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#C3565F" }) -- Darker red
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#C9A568" }) -- Darker yellow
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4E8DBA" }) -- Darker blue
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#A9744F" }) -- Darker orange
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6E8F5D" }) -- Darker green
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#9851A5" }) -- Darker violet
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#3C7F89" }) -- Darker cyan
		end

		local h5 = function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#8B464E" }) -- Less visible red
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#8C7850" }) -- Less visible yellow
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#466481" }) -- Less visible blue
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#785E46" }) -- Less visible orange
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#556D4A" }) -- Less visible green
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#6C4A78" }) -- Less visible violet
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#3B656C" }) -- Less visible cyan
		end

		local hooks = require "ibl.hooks"
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			h5()
		end)

		-- require("ibl").setup { indent = { highlight = highlight } }
		-- vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end
}
