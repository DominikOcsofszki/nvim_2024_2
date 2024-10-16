M                                         = {}
local lspconfig                           = require("lspconfig")
local util                                = require("lspconfig").util
local _capabilities                       = vim.lsp.protocol.make_client_capabilities()
M.capabilities                            = require('cmp_nvim_lsp').default_capabilities(_capabilities)
M.on_attach                            = require("autoload_plugins.plugin_setting.my_lsp_addons.utils").on_attach

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
M.basic_lsp_addons = function(NAME, ADDONS)
    lspconfig[NAME].setup(vim.tbl_deep_extend("force", basics_attack_capabilities_root_dir, ADDONS or {}))
end
M.basic_lsp                    = function(NAME)
    M.basic_lsp_addons(NAME)
end

M.jedi_language_server = function ()
    local addons = {}
    M.basic_lsp_addons("jedi_language_server",addons)
end

M.incc                                    = function()
    lspconfig.incc.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = { 'node', '/Users/dominikocsofszki/WS24/lsp2/server/out/incc-lsp.js' },
        filetypes = { 'tx', 'incc' },
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
        end,
    }
end




return M
-- M.pylsp             = function()
--     lspconfig.pylsp.setup {
--         -- on_attach = M.on_attach,
--         capabilities = M.capabilities,
--         settings = {
--             pylsp = {
--                 plugins = {
--                     -- formatter options
--                     ruff = { enabled = true },
--                     black = { enabled = false },
--                     autopep8 = { enabled = false },
--                     yapf = { enabled = false },
--                     -- linter options
--                     pylint = { enabled = true, executable = "pylint" },
--                     pyflakes = { enabled = false },
--                     pycodestyle = { enabled = false },
--                     -- type checker
--                     pylsp_mypy = { enabled = true },
--                     -- auto-completion options
--                     jedi_completion = { fuzzy = true },
--                     -- import sorting
--                     pyls_isort = { enabled = true },
--                 },
--             },
--         },
--         flags = {
--             debounce_text_changes = 200,
--         },
--     }
-- end
