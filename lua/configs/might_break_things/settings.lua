-- REMAP motions for inside "xxx" per cii instead of ci"
vim.keymap.set({ "o", "x" }, "ii", 'i"', { remap = true })
vim.keymap.set({ "o", "x" }, "ir", 'i]', { remap = true })
