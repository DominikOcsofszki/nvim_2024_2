local M = {}
local ls = require("luasnip") -- Ensure LuaSnip is properly required
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

local function tex_fig()
	ls.add_snippets("tex", {
		s({
			trig = "fig",
			name = "Insert Figure",
			dscr = "Snippet to insert a LaTeX figure environment",
		}, {
			f(function()
			end, {}),
		}),
		s("trigger", {
			t({ "After expanding, the cursor is here ->" }), i(1),
			t({ "", "After jumping forward once, cursor is here ->" }), i(2),
			t({ "", "After jumping once more, the snippet is exited there ->" }), i(0),
		})

	})
	ls.add_snippets("tex", {
		s({
			trig = "codeb",
			name = "codeb",
			dscr = "Insert a codeblock environment",
		}, {
			t("\\begin{codeblock}{python}{XXX:TODO}{label=todo}}"),
			-- t("\\begin{codeblock}{python}{XXX:TODO}"),
			-- t({ "", "{label=todo,", }),
			-- t({ "", "}" }),
			t({ "", "" }),
			i(1, "% Insert your code here %"),
			t({ "", "\\end{codeblock}" }),
		}),
	})
	ls.add_snippets("tex", {
		s({
			trig = "codebn",
			name = "codebn",
			dscr = "Insert a codeblock environment",
		}, {
			t("\\begin{codeblock}{python}{XXX:TODO}"),
			t({ "", "{label=todo,", }),
			t({ "", "%frame hidden,", }),
			t({ "", "minted options={linenos=false}," }),
			t({ "", "}" }),
			t({ "", "" }),
			i(1, "% Insert your code here %"),
			t({ "", "\\end{codeblock}" }),
		}),
	})

	-- 	ls.add_snippets("tex", {
	-- 		s({
	-- 			trig = "fig",
	-- 			name = "fig",
	-- 			dscr = "fig",
	-- 		}, {
	-- 			f(function()
	-- 				return
	-- 				[[
	-- \begin{figure}[htb]
	--     \centering
	--     \includegraphics[width=0.95\textwidth]{assets/imgs/}
	--     \caption{XXX}
	--     \label{fig:XXX}
	-- \end{figure}
	-- 				]]
	-- 			end, {}),
	-- 		}),
	-- 	})
end
local function tex_gls()
	local all_snip_gls = {
		"rpc",
		"json",
		"nvim",
		"vsc",
		"langf",
		"ireb",
		"lsprotokolls",
		"lsprotokoll",
		"rpc",
		"json",
		"nvim",
		"vsc",
		"ftcompl",
		"fthigh",
		"ftgoto",
		"ftreff",
		"fthov",
		-- "langf",
		"ftf",
		"ftdiag",
		"lss",
		"ireb",
		"lsprotokoll",
		"sdk",
		"codesmarts",


	}

	for index, gls_entry in ipairs(all_snip_gls) do
		ls.add_snippets("tex", {
			s({
				trig = gls_entry,
				name = gls_entry,
				dscr = gls_entry,
			}, {
				f(function()
					return "\\gls{" .. gls_entry .. "}"
				end, {}),
			}),
		})
	end
	ls.add_snippets("tex", {
		s({
			trig = "todo",
			name = "todo",
			dscr = "todo",
		}, {
			f(function()
				return "\\todo{"
			end, {}),
		}),
	})
end
M.addAllTexLuaSnip = function()
	tex_gls()
	tex_fig()
end
return M
