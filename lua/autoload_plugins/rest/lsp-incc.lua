local DEFAULT_PATH = { "/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3", "-m", "incc_lsp" }
local DEFAULT_DIRECT_PATH = { "/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3",
	"/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/__main__.py" }

return {
	{
		"DominikOcsofszki/lsp-incc.nvim",
		opts = {
			-- path = DEFAULT_PATH,
			path = DEFAULT_DIRECT_PATH,
			-- path = { "incc_lsp" }
		},
	}
}
