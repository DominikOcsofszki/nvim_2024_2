local conf = {
	layouts = { {
		elements = {
			{
				id = "watches",
				size = 0.2
			},
				{
					id = "repl",
					size = 0.7
				},
			-- {
			-- 	id = "watches",
			-- 	size = 0.2
			-- },
			-- {
			-- 	id = "stacks",
			-- 	size = 0.1
			-- },
		},
		position = "right",
		size = 80
	},
		-- {
		-- 	elements = {
		-- 	{
		-- 		id = "scopes",
		-- 		size = 1.
		-- 	},
		-- 		-- {
		-- 		-- 	id = "scopes",
		-- 		-- 	size = 0.5
		-- 		-- },
		-- 		-- {
		-- 		--        id = "console",
		-- 		--        size = 0.5
		-- 		--      }
		-- 	},
		-- 	position = "bottom",
		-- 	size = 20
		-- } 
	},
}

return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		require("dapui").setup(conf)
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		require("autoload_plugins.rest.dap_addons.asm")
		require("autoload_plugins.rest.dap_addons.python")
		-- dap.configurations.layouts = conf.layouts
		require("autoload_plugins.rest.dap_addons.dap_keybinds")
	end
}
