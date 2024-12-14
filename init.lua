vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath, })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
require("lazy").setup({
	{ import = "autoload_plugins.must" },
	{ import = "autoload_plugins.should" },
	{ import = "autoload_plugins.rest" },
})
require('configs.must')
require('configs.should')
require('configs.rest')
require('configs.load_all_filetype')
require('configs.might_break_things')
require('extra')
