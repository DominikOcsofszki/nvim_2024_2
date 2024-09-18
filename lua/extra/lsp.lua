vim.api.nvim_create_autocmd('FileType', {
  pattern = '*.tx',
  callback = function(args)
    vim.lsp.start({
      name = 'incc-server',
      cmd = {'/Users/dominikocsofszki/.local/share/nvim/mason/bin/incc-server-log'},
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`args.buf`) that contains either a "setup.py" or a
      -- "pyproject.toml" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      root_dir = vim.fs.root(args.buf, {'code.tx'}),
    })
  end,
})

vim.keymap.set('n','<leader>ls',function()
	-- local buf = vim.nvim_get_current_buf()
	local buf = 0
    vim.lsp.start({
      name = 'incc-server',
      -- cmd = {'/Users/dominikocsofszki/.local/share/nvim/mason/bin/incc-server-log'},
      cmd = {'python3','/Users/dominikocsofszki/THESIS/dev/regex/read_lsp.py'},
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`args.buf`) that contains either a "setup.py" or a
      -- "pyproject.toml" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      root_dir = vim.fs.root(buf, {'code.tx'}),
      -- root_dir = vim.fs.root(args.buf, {'code.tx'}),
    })
  end,{})

local configs = require 'lspconfig.configs'
local lspconfig = require("lspconfig")

local util = require 'lspconfig.util'

-- if not configs.incc_server then
--  configs.incc_server = {
--   default_config = {
--     cmd = { 'python3', '/Users/dominikocsofszki/THESIS/dev/regex/read_lsp.py' },
--     filetypes = { 'incc','tx' },
--     root_dir = util.root_pattern('code.tx', '.git','package-lock.json'),
--     single_file_support = true,
--     settings = {},
--     init_options = {
--       -- provideFormatter = true,
--       -- embeddedLanguages = { css = true, javascript = true },
--       -- configurationSection = { 'html', 'css', 'javascript' },
--     },
--   },
--   docs = {
--     description = [['INCC-LSP'
-- ]],
--   },
-- }
-- end
-- lspconfig.incc_server.setup{}


