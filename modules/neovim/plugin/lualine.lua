local function setup_lualine()
	vim.cmd.packadd('lualine.nvim')
	require 'lualine'.setup {
		options = {
			theme = 'auto',
			icons_enabled = true,
			component_separators = { left = '|', right = '|' },
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'diagnostics' },
			lualine_c = { 'buffers' },
			lualine_x = { 'filetype' },
			lualine_y = { 'branch' },
			lualine_z = { 'location' },
		},
	}
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	once = true,
	callback = setup_lualine,
})
