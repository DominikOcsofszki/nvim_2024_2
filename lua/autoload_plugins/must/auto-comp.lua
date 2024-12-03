return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<c-l>'] = cmp.mapping.complete(),
					-- ['<C-j>'] = cmp.mapping.select_next_item(),
					['<C-n>'] = cmp.mapping.select_next_item(),
					-- ['<c-k>'] = cmp.mapping.select_prev_item(),
					['<c-p>'] = cmp.mapping.select_prev_item(),
					['<c-y>'] = cmp.mapping.confirm({ select = true }),
					['<c-j>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					-- { name = 'buffer' }, -- This is used to get info form file/buffer
					{ name = 'path' },
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline({
					['<C-y>'] = { c = cmp.mapping.confirm({ select = true }) },
					['<C-j>'] = { c = cmp.mapping.confirm({ select = true }) },
					['<c-l>'] = cmp.mapping.complete(),


				}),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline({
					['<C-y>'] = { c = cmp.mapping.confirm({ select = true }) },
					['<C-j>'] = { c = cmp.mapping.confirm({ select = true }) },
					['<c-l>'] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				-- matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	} }
