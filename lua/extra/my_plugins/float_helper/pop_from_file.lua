local M = {}
local read_file = function(filepath)
  local file = io.open(filepath, "r")
  if not file then
    print("Could not open file: " .. filepath)
    return {}
  end
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  file:close()
  return lines
end

M.show_popup_from_file = function(filepath)
  local content = read_file(filepath)
  M.popUpFromText(content)

end

M.popUpFromText = function(content)
  M.popUpFromTextWidthHeight(content,70,40)
end
M.popUpFromTextWidthHeight = function (content,width,height)
  local buf = vim.api.nvim_create_buf(false, true)  -- Create unlisted scratch buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor(vim.o.columns ),
    row = math.floor(vim.o.lines),
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_opts)
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })

  -- vim.api.nvim_create_autocmd("BufLeave", {
  --   buffer = buf,
  --   callback = function() vim.api.nvim_win_close(win, true) end
  -- })
  
end
return M
