local M = {}
local FOLDER_FILES = "/Users/dominik/HOME/.config/nvim/lua/extra/txt_files/asm/"

local function list_files_to_indexed_table(dir)
  local indexed_table = {}
  local scandir = vim.loop.fs_scandir(dir)

  if scandir == nil then
    print("Failed to open directory: " .. dir)
    return indexed_table
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(scandir) -- Get the next file
    if name == nil then
      break
    end
    table.insert(indexed_table, name)
  end
  return indexed_table -- Return the indexed table
end

local MY_HELP_FILES = list_files_to_indexed_table(FOLDER_FILES)
local function prep_helper_files()
  -- Example usage:
  -- table.insert(MY_HELP_FILES,1,"Select from text")
  local print_files = {}
  for index, file in ipairs(MY_HELP_FILES) do
    print_files[index] = index .. ": " .. file
  end
  return print_files
end
local function select_from_text(files,MY_HELP_FILES)
  local input = vim.fn.inputlist(files)
  if input == "" or input == 0 then
    print("No item selected.")
    return
  end
  -- local file = files[input]
  local file = MY_HELP_FILES[input]
  -- print(file)
  return FOLDER_FILES .. file
end

local print_files = prep_helper_files()
M.returnHelper = function()
  return select_from_text(print_files,MY_HELP_FILES)
end

return M
