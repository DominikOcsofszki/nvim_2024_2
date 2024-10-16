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

local function show_popup_from_file(filepath)
  local content = read_file(filepath)

  local buf = vim.api.nvim_create_buf(false, true)  -- Create unlisted scratch buffer

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  local win_opts = {
    relative = "editor",
    width = 70,
    height = 40,
    -- col = math.floor((vim.o.columns - 50) / 2),
    col = math.floor(vim.o.columns ),
    -- row = math.floor((vim.o.lines - 20) / 2),
    row = math.floor(vim.o.lines),
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
local txt_dir = "/Users/dominik/HOME/.config/nvim/lua/extra/txt_files/"
-- -- Custom completion function
-- local function item_completion(arg_lead, cmd_line, cursor_pos)
--   -- Use the `vim.tbl_filter` function to filter items that match the current input (arg_lead)
--   return vim.tbl_filter(function(item)
--     return vim.startswith(item, arg_lead)
--   end, items)
-- end

local options = {
  'Select file:',
  '1. latex.txt',
  '2. asm.txt',
}


-- Show input list and get the user's selection

local function ask_for_input_with_completion()
  -- local input = vim.fn.input("Choose a file: ", "", "customlist,v:lua.item_completion")
  local input = vim.fn.inputlist(options)
  -- Check if the user provided an input
  if input == "" then
    print("No item selected.")
    return
  end
  local file
    if input == 2 then
    file ="asm.txt"
  end
    if input == 1 then
    file ="latex.txt"
  end
  -- print("You selected: " .. file)
  show_popup_from_file(txt_dir .. file)

end

-- Call the function
ask_for_input_with_completion()
