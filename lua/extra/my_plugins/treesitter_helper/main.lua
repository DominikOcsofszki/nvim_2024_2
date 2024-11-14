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

local print_findings = function(query, tree, bufnr)
	for pattern, match, metadata in query:iter_matches(tree:root(), bufnr) do
		for id, nodes in pairs(match) do
			local text = vim.treesitter.get_node_text(nodes, bufnr)
			print(text)
		end
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

local qtest = vim.treesitter.query.parse('python', [[
  (function_definition)
    name: (identifier)@test_func
    ;name: (identifier)@test_func
		(#match? @test_func "^test_")
		;)
  ]])

M.setup = function()
	vim.api.nvim_create_user_command('ExtractAttributes', extract_attribrutes, {})
	vim.api.nvim_create_user_command('ExtractTests', function() extract_attributes_from_query(qtest, 'python') end, {})
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
