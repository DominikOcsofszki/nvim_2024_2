
local M = {}
M.setup = function ()
				vim.cmd("highlight MyCustomHighlightGroup guifg=#FF66AA gui=bold")

				local function highlight_words(words)
						for _, word in ipairs(words) do
								vim.fn.matchadd("MyCustomHighlightGroup", "\\<" .. word .. "\\>")
						end
				end

				local words_to_highlight = { "stp", "str", }

				highlight_words(words_to_highlight)
end
return M
