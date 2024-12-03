local M = {}
M.jdtls = function()
	require('lspconfig').jdtls.setup({
		-- settings = {
		-- 	java = {
		-- 		configuration = {
		-- 			runtimes = {
		-- 				{
		-- 					name = "JavaSE-23",
		-- 					path = "/usr/bin/java",
		-- 					default = true,
		-- 				}
		-- 			}
		-- 		}
		-- 	}
		-- }
	})
end
return M
