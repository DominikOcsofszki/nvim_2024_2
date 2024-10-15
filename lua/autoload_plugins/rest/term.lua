return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup()
    vim.keymap.set({ 't', 'n', 'i' }, "<c-`>", function() vim.cmd("ToggleTerm direction=tab") end, {})
  end
}
