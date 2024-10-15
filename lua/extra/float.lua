-- Create a new buffer
local buf = vim.api.nvim_create_buf(false, true)  -- Create a non-listed, scratch buffer

-- Add some content to the buffer
vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
  "Hello, this is a popup!",
  "You can add any content here."
})

-- Define window options
local win_opts = {
  relative = "editor",
  width = 30,
  height = 5,
  col = math.floor((vim.o.columns - 30) / 2),  -- Center the popup horizontally
  row = math.floor((vim.o.lines - 5) / 2),     -- Center the popup vertically
  style = "minimal",                           -- Minimal style with no borders
  border = "rounded"                           -- Add a rounded border
}

-- Open the floating window
local win = vim.api.nvim_open_win(buf, true, win_opts)

-- Set an autocmd to close the popup with any keypress
vim.api.nvim_create_autocmd("BufLeave", {
  buffer = buf,
  callback = function() vim.api.nvim_win_close(win, true) end
})
