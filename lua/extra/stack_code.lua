-- Function to read the file and return its content as a table of lines
local function read_file(filepath)
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

-- Function to create a popup window from the file content
local function show_popup_from_file(filepath)
  -- Read file content
  local content = read_file(filepath)

  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)  -- Create unlisted scratch buffer

  -- Set buffer content to file content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  -- Define window options
  local win_opts = {
    relative = "editor",
    width = 100,
    height = 20,
    col = math.floor((vim.o.columns - 50) / 2),
    row = math.floor((vim.o.lines - 20) / 2),
    style = "minimal",
    border = "rounded",
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_opts)
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })

  -- Autoclose the popup when the buffer is left
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = buf,
    callback = function() vim.api.nvim_win_close(win, true) end
  })
end

-- Example usage: Load and display the file "example.txt"
-- show_popup_from_file("/Users/dominik/HOME/.config/nvim/lua/extra/info.txt")
show_popup_from_file("")
