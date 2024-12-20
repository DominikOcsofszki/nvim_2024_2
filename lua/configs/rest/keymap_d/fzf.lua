









local mac_syscalls = require("configs.rest.keymap_d.syscall").syscalls
local keys = {}

for _, syscall in ipairs(mac_syscalls) do
	table.insert(keys, "#" .. syscall.value .. " ;" .. syscall.key)
end


vim.keymap.set('n', '<leader>i', function()
	require("fzf-lua").fzf_exec(keys, {
		complete = true,
		sink = function(selected)
			-- local syscall_key = selected:match("%S+%s+(.+)")
			-- vim.api.nvim_put({syscall_key}, "", true, true)
			vim.api.nvim_put({selected}, "", true, true)
		end,
	})
end, {})
