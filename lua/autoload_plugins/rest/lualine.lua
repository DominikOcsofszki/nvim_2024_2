return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
-- Just add a component in your lualine config
{
  sections = {
    lualine_x = {
      "rest"
    }
  }
},

-- To use a custom icon and color
{
  sections = {
    lualine_x = {
      {
        "rest",
        icon = "",
        fg = "#428890"
      }
    }
  }
}
	}
}
