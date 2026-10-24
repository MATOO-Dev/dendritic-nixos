local function setup_treesitter()
	vim.cmd.packadd 'nvim-treesitter'
	-- build = ':TSUpdate'
	require 'nvim-treesitter'.setup {
		auto_install = false,
		-- bash
		-- c
		-- cpp
		-- gdscript
		-- gdshader
		-- godot_resource
		-- lua
		-- luadoc
		-- markdown
		-- markdown_inline
		-- rust
		-- vim
		-- vimdoc
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	}
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	callback = setup_treesitter,
})
