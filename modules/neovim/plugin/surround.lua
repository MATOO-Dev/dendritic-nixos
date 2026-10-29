vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	once = true,
	callback = function()
		vim.cmd.packadd('nvim-surround')
	end,
})
