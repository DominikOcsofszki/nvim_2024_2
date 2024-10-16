-- Function to list all .txt files in a given directory using Neovim's API
local function list_txt_files_in_dir(dir)
  local scandir = vim.loop.fs_scandir(dir)  -- Scan the directory
  if scandir == nil then
    print("Failed to open directory: " .. dir)
    return
  end

  print("Text files in directory: " .. dir)
  while true do
    local name, type = vim.loop.fs_scandir_next(scandir)  -- Get the next file
    if name == nil then
      break
    end
    if type == "file" and name:match("%.txt$") then  -- Check if the file has a .txt extension
      print(name)
    end
  end
end

-- Call the function for the current directory
list_txt_files_in_dir("/Users/dominik/HOME/.config/nvim/lua/extra/txt_files/")

local txt_dir = "/Users/dominik/HOME/.config/nvim/lua/extra/txt_files/"

local options = {
  'Select file:',
  '1. latex.txt',
  '2. asm.txt',
}


local function ask_for_input_with_completion()
  local input = vim.fn.inputlist(options)
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

-- -- Custom completion function
-- local function item_completion(arg_lead, cmd_line, cursor_pos)
--   -- Use the `vim.tbl_filter` function to filter items that match the current input (arg_lead)
--   return vim.tbl_filter(function(item)
--     return vim.startswith(item, arg_lead)
--   end, items)
-- end

