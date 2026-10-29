local function setup_flash()
	if not package.loaded['flash.nvim'] then
		vim.cmd.packadd('flash.nvim')
		require 'flash'.setup {}
	end
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	once = true,
	callback = setup_flash,
})

vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
	setup_flash()
	require 'flash'.jump()
end, { desc = 'Flash jump' })

vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
	setup_flash()
	require 'flash'.treesitter()
end, { desc = 'Flash treesitter' })

vim.keymap.set('o', 'r', function()
	setup_flash()
	require 'flash'.remote()
end, { desc = 'Flash remote' })

vim.keymap.set({ 'x', 'o' }, 'R', function()
	setup_flash()
	require 'flash'.treesitter_search()
end, { desc = 'Flash treesitter search' })

vim.keymap.set('c', '<c-s>', function()
	setup_flash()
	require 'flash'.toggle()
end, { desc = 'Flash toggle search' })
