require 'telescope'.setup {}

vim.keymap.set('n', '<leader>ff', function()
	require 'telescope.builtin'.find_files()
end, { desc = 'Telescope [F]ind [F]iles' })
