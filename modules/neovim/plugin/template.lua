-- lazy load on event
vim.api.nvim_create_autocmd({ 'event' }, {
	once = true,
	callback = function()
		vim.cmd.packadd('plugin')
		-- usually not required for vimscript plugins
		require 'plugin'.setup {}
	end,
})

-- lazy load on keybind
vim.keymap.set('n', 'keybind', function()
	if not package.loaded['plugin'] then
		-- block can be pulled out into function
		-- good for multiple lazy-loading keybinds
		vim.cmd.packadd('plugin')
		require 'plugin'.setup {}
	end
	-- plugin-dependent
	require 'plugin'.do_stuff()
	-- alternatively for some vimscript plugins
	vim.cmd.do_stuff()
end, { desc = 'my plugin' })
