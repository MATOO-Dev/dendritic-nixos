vim.keymap.set('n', '<leader>ut', function()
	if vim.fn.exists(':UndotreeToggle') == 0 then
		vim.cmd.packadd('undotree')
	end
	vim.cmd.UndotreeToggle()
	vim.cmd.UndotreeFocus()
end, { desc = '[U]ndotree [T]oggle' })
