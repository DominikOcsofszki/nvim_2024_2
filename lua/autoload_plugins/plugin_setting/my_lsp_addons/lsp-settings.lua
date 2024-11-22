M                                         = {}
local lspconfig                           = require("lspconfig")
local configs                             = require("lspconfig.configs")
local util                                = require("lspconfig").util
local _capabilities                       = vim.lsp.protocol.make_client_capabilities()
M.capabilities                            = require('cmp_nvim_lsp').default_capabilities(_capabilities)
M.on_attach                               = require("autoload_plugins.plugin_setting.my_lsp_addons.utils").on_attach

local basics_attack_capabilities_root_dir = {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	-- root_dir = M.root_dir
}

M.ltex                                    = function()
	local path_spelling = vim.fn.stdpath("config") .. "/files/spell-de.utf-8"
	vim.keymap.set('n', '<leader>aw', ':!echo <c-r><c-w> >> /Users/dominik/home/.config/nvim/files/spell-de.utf-8',
		{})
	vim.keymap.set('v', '<leader>aw', 'y:!echo <c-r>" >> /Users/dominik/home/.config/nvim/files/spell-de.utf-8', {})
	local spell_de = {}
	for word in io.open(path_spelling, "r"):lines() do
		table.insert(spell_de, word)
	end

	require("lspconfig").ltex.setup {
		capabilities = M.capabilities,
		on_attach = M.on_attach,
		filetypes = { 'txt' },
		settings = {
			ltex = {
				language = "de-DE",
				dictionary = {
					['de-DE'] = spell_de
				}
			},
		},
	}
end
-- local basics = {vim.cmd("echo 'test'")}
M.basic_lsp_addons                        = function(NAME, ADDONS)
	lspconfig[NAME].setup(vim.tbl_deep_extend("force", basics_attack_capabilities_root_dir, ADDONS or {}))
end
M.basic_lsp                               = function(NAME)
	M.basic_lsp_addons(NAME)
end

M.jedi_language_server                    = function()
	local addons = {}
	M.basic_lsp_addons("jedi_language_server", addons)
end

M.incc                                    = function()
	lspconfig.incc.setup {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		cmd = { 'node', '/Users/dominikocsofszki/WS24/lsp2/server/out/incc-lsp.js' },
		filetypes = { 'tx', 'incc', 'py' },
		root_dir = function(fname)
			return require("lspconfig").util.find_git_ancestor(fname)
			-- return lspconfig.util.find_git_ancestor(fname)
		end,
	}
end
M.incc_py                                 = function()
	lspconfig.incc_py.setup {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		cmd = { '/Users/dominik/HOME/BA/DEV/MAIN/.venv/bin/python3.12', '/Users/dominik/HOME/BA/DEV/MAIN/src/incc_lsp/server2.py' },
		filetypes = { 'test' },
		root_dir = function(fname)
			return lspconfig.util.find_git_ancestor(fname)
		end,
	}
end

local fun_disable_pylint_rules            = function(rules)
	local args = {}
	for index, rule in ipairs(rules) do
		table.insert(args, "-d " .. rule)
	end
	return args
end

local disable_pylint_rules                = {
	'C0114',
	'C0115',
	'R0903',
	'C0103',
	'C0103',
	'E501',
	'W0012',
	'W292',
}
fun_disable_pylint_rules(disable_pylint_rules)

M.pylsp = function()
	lspconfig.pylsp.setup {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		settings = {
			pylsp = {
				plugins = {
					pylint = {
						maxLineLength = 30,
						enabled = false,
						executable = "pylint",
						args = fun_disable_pylint_rules(disable_pylint_rules)
					},

				}
				-- ruff = { enabled = true },

				-- 	-- formatter options
				-- 	ruff = { enabled = true },
				-- 	black = { enabled = true },
				-- 	autopep8 = { enabled = false },
				-- 	yapf = { enabled = false },
				-- 	-- linter options
				-- 	pyflakes = { enabled = false },
				-- 	pycodestyle = { enabled = false },
				-- 	-- type checker
				-- 	pylsp_mypy = { enabled = true },
				-- 	-- auto-completion options
				-- 	jedi_completion = { fuzzy = true },
				-- 	-- import sorting
				-- 	pyls_isort = { enabled = true },
				--
				--
				-- },
			},
		},
		flags = {
			debounce_text_changes = 200,
		},
	}
end

M.lua_ls = function()
	require 'lspconfig'.lua_ls.setup {
		on_attach = M.on_attach,
		capabilities = M.capabilities,

		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT'
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					-- checkThirdParty = false,
					checkThirdParty = true,
					-- library = {
					-- 	vim.env.VIMRUNTIME
					-- 	-- Depending on the usage, you might want to add additional paths here.
					-- 	-- "${3rd}/luv/library"
					-- 	-- "${3rd}/busted/library",
					-- }
					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
					library = vim.api.nvim_get_runtime_file("", true)
				}
			})
		end,
		settings = {
			Lua = {}
		}
	}
end

return M
