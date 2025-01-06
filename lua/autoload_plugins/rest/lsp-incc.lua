return {
	{
		"DominikOcsofszki/lsp-incc.nvim",
		opts = {
			-- path = { "incc_lsp" }
		},
		dependencies =
		{
			"hrsh7th/cmp-nvim-lsp",
			dependencies = {
				'neovim/nvim-lspconfig',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'hrsh7th/nvim-cmp',
			},
			"neovim/nvim-lspconfig"
		},
		build = 'sh install.sh'
	}
}
