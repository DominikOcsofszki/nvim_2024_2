local LSP_IMPORTS              = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-all-import")
local M                        = {}
local fun_disable_pylint_rules = function(rules)
	local args = {}
	for index, rule in ipairs(rules) do
		table.insert(args, "-d " .. rule)
	end
	return args
end

local disable_pylint_rules     = {
	'C0114',
	'C0115',
	'R0903',
	'C0103',
	'C0103',
	'E501',
	'W0012',
	'W292',
	'E501',
}
fun_disable_pylint_rules(disable_pylint_rules)

-- settings = {
--   pylsp = {
--     plugins = {
--       pycodestyle = {
--         ignore = {'W391'},
--         maxLineLength = 100
--       }
--     }
--   }
-- }
M.pylsp = function()
	require("lspconfig").pylsp.setup {
		on_attach = LSP_IMPORTS.on_attach,
		capabilities = LSP_IMPORTS.capabilities,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { 'W391' },
						maxLineLength = 120
					},
					pylint = {
						maxLineLength = 120,
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
return M
