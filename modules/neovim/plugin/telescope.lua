vim.keymap.set('n', '<leader>ff', function()
	vim.cmd.packadd('telescope.nvim')
	require 'telescope'.setup {}
	require 'telescope.builtin'.find_files()
end, { desc = 'Telescope [F]ind [F]iles' })
