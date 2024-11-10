





local f = io.open("/tmp/output.json", "w") if f then f:write(vim.fn.json_encode(vim.lsp.protocol.make_client_capabilities())) f:close() else print("Error: Unable to open file for writing.") end
