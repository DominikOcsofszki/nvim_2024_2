-- local FloatHelper = require "extra/my_plugins/float_helper/pop_from_file"
local FloatHelper = require "extra/my_plugins/treesitter_helper/show_msg"
local M = {}
local prep_tree = function(bufnr, lang)
	local parser = vim.treesitter.get_parser(bufnr, lang)
	local tree = parser:parse()[1]
	return tree
end
local use_query = function()
	local query1 = vim.treesitter.query.parse('html', [[
    (attribute
      (attribute_name) @attribute-name
      (quoted_attribute_value (attribute_value) @attribute-value))
  ]])
	local query2 = vim.treesitter.query.parse('html', [[
(attribute
  (attribute_name) @attribute-name)
  ]])

	local query = query2
	return query
end
local DEBUG = false
--- Function to print findings from a Tree-Sitter query.
---@param query userdata The Tree-Sitter query to match.
---@param tree userdata The syntax tree to search.
---@param bufnr integer The buffer number containing the text.
local print_findings = function(query, tree, bufnr)
	local tbl = {}
	for pattern, match, metadata in query:iter_matches(tree:root(), bufnr) do
		---@type integer pattern -- Pattern ID
		---@type table<integer, TSNode> match -- Match table containing TSNode elements
		---@type table metadata -- Metadata for the match (optional)
		for id, node in pairs(match) do
			---@type integer id -- ID of the captured node
			---@type TSNode node -- The Tree-Sitter node
			local text = vim.treesitter.get_node_text(node, bufnr)
			-- vim.print(text)
			---@type string text -- res
			if not DEBUG then
				table.insert(tbl, text)
			else
				vim.print(node:type())
				vim.print(node:symbol())
				vim.print(node:named())
				vim.print(node:missing())
				vim.print(node:extra())
				vim.print(node:id())
				vim.print(node:metadata())
				-- vim.print(nodes:field('name'))
				-- vim.print(nodes:child_count())
				-- vim.print(nodes:child())
				-- vim.print(nodes:named_child_count())
				-- vim.print("======start_end===========")
				--
				-- -- vim.print(nodes:start())
				-- -- vim.print(nodes:end_())
				-- vim.print(nodes:range())
				vim.print("=================")
				if text.find(text, "_print") then
					print(text)
				end
			end
		end
	end
	if not DEBUG then
		FloatHelper.popUpFromText(tbl)
	end
end

local function extract_attributes_from_query(query, lang)
	local bufnr = vim.api.nvim_get_current_buf()
	local tree = prep_tree(0, lang)
	print_findings(query, tree, bufnr)
end

local function extract_attribrutes()
	local query = use_query()
	extract_attributes_from_query(query, 'html')
end

local create_tree_cmd = function(name, query, lang)
	vim.api.nvim_create_user_command(name, function() extract_attributes_from_query(query, lang) end, {})
end
local queriesList = require "extra.my_plugins.treesitter_helper.queries"
M.setup = function()
	vim.api.nvim_create_user_command('ExtractAttributes', extract_attribrutes, {})
	create_tree_cmd('ExtractClasses', queriesList.q_class, 'python')
	create_tree_cmd('ExtractTests', queriesList.q_test, 'python')
	create_tree_cmd('ET', queriesList.q_test, 'python')
	create_tree_cmd('ETM', queriesList.q_class_method_name, 'python')
end
return M

-- local function extract_attributes()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local parser = vim.treesitter.get_parser(bufnr, 'html')
-- 	local tree = parser:parse()[1]
-- 	local query = vim.treesitter.query.parse('html', [[
--     (attribute
--       (attribute_name) @attribute-name
--       (quoted_attribute_value (attribute_value) @attribute-value))
--   ]])
-- 	for pattern, match, metadata in query:iter_matches(tree:root(), bufnr) do
-- 		-- local text = vim.treesitter.get_node_text(match[1], bufnr)
-- 		for id, nodes in pairs(match) do
-- 			local text = vim.treesitter.get_node_text(nodes, bufnr)
-- 			print(" Content:" .. id, text)
-- 		end
--
-- 		-- print("Text Content:", text)
-- 	end
-- 	--
-- 	-- for pattern, match, metadata in query:iter_matches(tree:root(), bufnr, 0, -1, { all = true }) do
-- 	-- 	for id, nodes in pairs(match) do
-- 	-- 		local name = query.captures[id]
-- 	-- 		for _, node in ipairs(nodes) do
-- 	-- 			vim.print(name)
-- 	-- 			vim.print(node)
-- 	-- 			vim.print(pattern)
-- 	-- 			local node_data = metadata[id] -- Node level metadata
-- 	-- 			vim.print(node_data)
-- 	-- 			vim.print(metadata)
-- 	-- 			vim.print(pattern, match, metadata)
-- 	-- 			-- ... use the info here ...
-- 	-- 		end
-- 	-- 	end
-- 	-- end
-- end
