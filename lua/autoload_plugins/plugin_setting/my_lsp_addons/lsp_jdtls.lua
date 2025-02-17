local LSP_IMPORTS = require("autoload_plugins.plugin_setting.my_lsp_addons.lsp-all-import")

local home = vim.fn.getenv("HOME")

-- local ON_ATTACH_JDTLS = function(_, bufnr)
-- 	local nmap = function(mode, keys, func, desc)
-- 		if desc then
-- 			desc = 'LSP: ' .. desc
-- 		end
-- 		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
-- 	end
--
-- 	nmap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
-- 	nmap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>")
-- 	nmap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
-- 	nmap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>")
-- 	nmap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
-- 	nmap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
-- 	nmap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
--
-- 	vim.api.nvim_exec([[
-- 	          hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
-- 	          hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
-- 	          hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
-- 	          augroup lsp_document_highlight
-- 	            autocmd!
-- 	            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
-- 	            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
-- 	          augroup END
-- 	      ]], false)
-- 	LSP_IMPORTS.ON_ATTACH(_, bufnr)
-- end


-- https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
-- eclipse-java-google-style.xml
local jdtls_settings = {
	['java.format.settings.url'] = home .. "/.config/nvim/etc/java-google-formatter.xml",
	['java.format.settings.profile'] = "GoogleStyle",
	java = {
		signatureHelp = { enabled = true },
		contentProvider = { preferred = 'fernflower' },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*"
			}
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
			}
		},
		configuration = {
			runtimes = {
				{
					name = "Java",
					-- path = vim.fn.getenv("java"),
					-- path = "/opt/homebrew/Cellar/openjdk@21/21.0.5/libexec/openjdk.jdk/Contents/Home",
				},
			}
		},
	},
}

local M              = {}
M.jdtls              = function()
	-- local jdtls_cmd = { 'java-lsp', workspace_folder }

	local jar_patterns = {
		-- '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
		-- '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
		-- '/dev/microsoft/vscode-java-test/server/*.jar',
	}
	local bundles = {}
	for _, jar_pattern in ipairs(jar_patterns) do
		for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
			if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
				table.insert(bundles, bundle)
			end
		end
	end

	local extendedClientCapabilitiesjdtls                             = require 'jdtls'.extendedClientCapabilities
	extendedClientCapabilitiesjdtls.resolveAdditionalTextEditsSupport = true
	local init_options_jdtls                                          = {
		bundles = bundles,
		extendedClientCapabilities = extendedClientCapabilitiesjdtls,
	}

	-- UI
	local finders                                                     = require 'telescope.finders'
	local sorters                                                     = require 'telescope.sorters'
	local actions                                                     = require 'telescope.actions'
	local pickers                                                     = require 'telescope.pickers'
	require('jdtls.ui').pick_one_async                                = function(items, prompt, label_fn, cb)
		local opts = {}
		pickers.new(opts, {
			prompt_title    = prompt,
			finder          = finders.new_table {
				results = items,
				entry_maker = function(entry)
					return {
						value = entry,
						display = label_fn(entry),
						ordinal = label_fn(entry),
					}
				end,
			},
			sorter          = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr)
				actions.goto_file_selection_edit:replace(function()
					local selection = actions.get_selected_entry(prompt_bufnr)
					actions.close(prompt_bufnr)

					cb(selection.value)
				end)

				return true
			end,
		}):find()
	end

	require('lspconfig').jdtls.setup({
		on_attach = LSP_IMPORTS.ON_ATTACH,
		-- on_attach = ON_ATTACH_JDTLS,

		-- capabilities = LSP_IMPORTS.capabilities,
		capabilities = extendedClientCapabilitiesjdtls,
		settings = jdtls_settings
	})
end
return M

-- cmd = {
--     'java', -- Make sure this points to the correct Java binary
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.level=ALL',
--     '-Xms1g',
--     '-Xmx2G',
--     '-javaagent:' .. jdtls_path .. '/lombok.jar',
--     '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--     '-configuration', jdtls_path .. '/config_mac',
--     '-data', vim.fn.stdpath('data') .. '/jdtls-workspace',
-- },
