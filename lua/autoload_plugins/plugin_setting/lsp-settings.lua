M = {}
local lspconfig = require("lspconfig")

M.on_attach         = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    nmap('<leader>ga', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('ga', vim.lsp.buf.code_action, '[C]ode [A]ction')
    -- nmap("<leader>]", function() vim.diagnostic.goto_next() end, '[G]oto [D]iagnostics')
    -- nmap("<leader>[", function() vim.diagnostic.goto_prev() end, '[G]oto [D]iagnostics')
    nmap('<leader>gr', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('<leader>gR', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>gD', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>gh', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>g=', vim.lsp.buf.signature_help, 'Signature Documentation')

    vim.api.nvim_buf_create_user_command(bufnr, 'F', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local _capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities      = require('cmp_nvim_lsp').default_capabilities(_capabilities)

M.ltex              = function()
    local path_spelling = vim.fn.stdpath("config") .. "/files/spell-de.utf-8"
    vim.keymap.set('n', '<leader>aw', ':!echo <c-r><c-w> >> /Users/dominikocsofszki/.config/nvim/files/spell-de.utf-8',
        {})
    vim.keymap.set('v', '<leader>aw', 'y:!echo <c-r>" >> /Users/dominikocsofszki/.config/nvim/files/spell-de.utf-8', {})
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
M.pylsp             = function()
    lspconfig.pylsp.setup {
        on_attach = M.on_attach,
        settings = {
            pylsp = {
                plugins = {
                    -- formatter options
                    ruff = { enabled = true },
                    black = { enabled = false },
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },
                    -- linter options
                    pylint = { enabled = true, executable = "pylint" },
                    pyflakes = { enabled = false },
                    pycodestyle = { enabled = false },
                    -- type checker
                    pylsp_mypy = { enabled = true },
                    -- auto-completion options
                    jedi_completion = { fuzzy = true },
                    -- import sorting
                    pyls_isort = { enabled = true },
                },
            },
        },
        flags = {
            debounce_text_changes = 200,
        },
        capabilities = M.capabilities,
    }
end


M.incc  = function ()
        lspconfig.incc.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
         cmd = {'node','/Users/dominikocsofszki/WS24/lsp2/server/out/incc-lsp.js'},
         filetypes = {'tx','incc'},
         root_dir = function(fname)
           return lspconfig.util.find_git_ancestor(fname)
         end,
    }
end




return M
