require 'oil'.setup {
	default_file_explorer = true,
	delete_to_trash = true,
	view_options = { show_hidden = true },
	columns = { 'icon' },
	use_default_keymaps = true,
	keymaps = { ['<bs>'] = 'actions.parent' },
}

vim.keymap.set('n', '<leader>ol', '<cmd>Oil<cr>', { desc = '[O]i[L]' })
