vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	once = true,
	callback = function()
		vim.cmd.packadd('vim-wordmotion')
	end,
})
