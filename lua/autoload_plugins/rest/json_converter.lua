return {
	"Redoxahmii/json-to-types.nvim",
	-- config = function()
	-- 	require("json-to-types").setup()
	-- end,
	build = "sh install.sh npm",
	keys = {
		{
			"<leader>cjj",
			"<CMD>ConvertJSONtoLangBuffer java<CR>",
			desc = "Convert JSON to java in buffer",
		},
		{
			"<leader>cj",
			"<CMD>ConvertJSONtoLang java<CR>",
			desc = "Convert JSON to java",
		},
		{
			"<leader>cu",
			"<CMD>ConvertJSONtoLang typescript<CR>",
			desc = "Convert JSON to TS",
		},
		{
			"<leader>ct",
			"<CMD>ConvertJSONtoLangBuffer typescript<CR>",
			desc = "Convert JSON to TS in buffer",
		},
	},
}
