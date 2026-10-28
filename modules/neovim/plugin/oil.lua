local function setup_oil()
	vim.cmd.packadd('oil')
	require 'oil'.setup {
		default_file_explorer = true,
		delete_to_trash = true,
		view_options = { show_hidden = true },
		columns = { 'icon' },
		use_default_keymaps = true,
		keymaps = { ['<bs>'] = 'actions.parent' },
	}
end

vim.keymap.set('n', '<leader>ol', function()
	if not package.loaded['oil'] then
		setup_oil()
	end
	require 'oil'.open()
end, { desc = '[O]i[L]' })
