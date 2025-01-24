local DEFAULT_PATH = { "/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3", "-m", "incc_lsp" }
local DEFAULT_DIRECT_PATH = { "/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3",
	"/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/__main__.py" }

local LATEX_TEXT_HELPER = {
	'/Users/dominik/HOME/LSP_LATEX_HELP/.venv/bin/python',
	'/Users/dominik/HOME/LSP_LATEX_HELP/src/lsp/SERVER.py'
}

local withPIPE = { "/Users/dominik/HOME/BA/DEV/MAIN/SERVER_PIPE_BOTH.sh" }

return {
	{
		"DominikOcsofszki/lsp-incc.nvim",
		opts = {
			-- path = withPIPE
			-- path = DEFAULT_PATH,
			-- DEFAULT INCC:
			-- path = DEFAULT_DIRECT_PATH,
			path = LATEX_TEXT_HELPER,
			filetypes = { 'tex' }

		},
	}
}
