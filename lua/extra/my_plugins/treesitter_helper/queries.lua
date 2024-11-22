local M = {}
local prep_parse_python = function(query)
	return vim.treesitter.query.parse('python', query)
end

local item = [[
((class_definition
    name: (identifier)@class_name
    (#not-match? @class_name "^test_"))
)
]]
local class_methode = [[
((class_definition
    body: (block
        (function_definition
            name: (identifier)@method_name
            parameters: (parameters)@method_params
            (#not-match? @method_name "^test_")
        ) @method_def))
)
]]
local class_methode_name = [[
((class_definition
    body: (block
        (function_definition
            name: (identifier)@method_name
            parameters: (parameters)
        ) ))
)
]]

local q_test = [[
  (function_definition)
    name: (identifier)@test_func
		(#match? @test_func "^test_")
		;)
  ]]
M.q_test = prep_parse_python(q_test)
M.q_class = prep_parse_python(item)
M.q_class_method = prep_parse_python(class_methode)
M.q_class_method_name = prep_parse_python(class_methode_name)

-- 	 (function_definition)
--     name: (identifier)@test_func
-- 		(#match? @test_func "^test_")
-- 		;)@aasdasd
--
-- ((function_definition
--     name: (identifier)@test_func
--     (#match? @test_func "^test_"))
--     @function
-- )
-- ((class_definition
--     name: (identifier)@class_name
--     (#not-match? @class_name "^test_"))
--     @class
-- )
return M
