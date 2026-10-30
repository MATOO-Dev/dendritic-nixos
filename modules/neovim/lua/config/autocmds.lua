-- disable newline comment continuation
vim.cmd 'autocmd BufEnter * set formatoptions-=r'
-- t = auto-wrap using textwidth
-- c = auto-wrap using textwidth and enter comment leader
-- r = continue comments on enter
-- o = continue comments on o/O

-- automatically connect to godothost server
-- TODO: is this required when lspconfig sets it?
GDConnected = false
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
	desc = 'Connect to godothost',
	pattern = { '*.gd', '*.gdshader', '*.tscn', '*.tres' },
	callback = function()
		if GDConnected then
			return
		end
		local project_file = vim.fn.getcwd() .. '/project.godot'
		if project_file then
			vim.fn.serverstart './godothost'
			print 'Connected to godothost'
			GDConnected = true
		end
	end,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	desc = 'Files without filetpe, so no ftplugin possible',
	pattern = { '[^.]\\+' },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
-- 	desc = 'Debug Filetype',
-- 	pattern = { '*' },
-- 	callback = function()
-- 		if vim.cmd.expand('%:t') !~ '\.' then
-- 			print 'file without type'
-- 		end
-- 	end
-- })
