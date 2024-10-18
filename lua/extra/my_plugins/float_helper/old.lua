
local function get_longest_line_length()
    local max_length = 0
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    for _, line in ipairs(lines) do
        if #line > max_length then
            max_length = #line
        end
    end

    return max_length
end
