local CHECK_CMDS = { "rg", "fd" }

local check = {}

for _, cmd in ipairs(CHECK_CMDS) do
    -- vim.print(cmd)
    table.insert(check, {
        package = {{
            name = cmd,
            binaries = { cmd }
        }}
    })
end

local check_binary_installed = function(package)
	local binaries = package.binaries or { package.name }
	for _, binary in ipairs(binaries) do
		local found = vim.fn.executable(binary) == 1
		if not found then
			binary = binary .. ".exe"
			found = vim.fn.executable(binary) == 1
		end
		if found then
			local handle = io.popen(binary .. " --version")
			local binary_version = handle:read "*a"
			handle:close()
			return true, binary_version
		end
	end
end
vim.print("Checking external dependencies")
local ok = vim.print
local error = vim.print
local info = vim.print
for _, opt_dep in pairs(check) do
	for _, package in ipairs(opt_dep.package) do
		local installed, version = check_binary_installed(package)
		if not installed then
			local err_msg = ("%s: not found."):format(package.name)
			if package.optional then
				warn(("%s %s"):format(err_msg, ("Install %s for extended capabilities"):format(package.url)))
			else
				error(
					("%s %s"):format(
						err_msg,
						("`%s` finder will not function without %s installed."):format(opt_dep.finder_name, package.url)
					)
				)
			end
		else
			local eol = version:find "\n"
			local ver = eol and version:sub(0, eol - 1) or "(unknown version)"
			ok(("%s: found %s"):format(package.name, ver))
		end
	end
end
