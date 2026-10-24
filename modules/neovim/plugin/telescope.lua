vim.keymap.set('n', '<leader>ff', function()
	if not package.loaded['telescope'] then
		vim.cmd.packadd('telescope.nvim')
		require 'telescope'.setup {}
	end
	require 'telescope.builtin'.find_files()
end, { desc = 'Telescope [F]ind [F]iles' })
