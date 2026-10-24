local function setup_conform()
	vim.cmd.packadd('conform.nvim')
	require 'conform'.setup {
		format_on_save = {
			timeout_ms = 500,
			-- lsp_format = 'fallback'
		},
		formatters_by_ft = {
			c = { 'clang-format' },
			cpp = { 'clang-format' },
			csharp = { '' },
			gdscript = { 'gdformat' },
			gdshader = { 'gdformat' },
			glsl = { '' },
			lua = { 'stylua' },
			nix = { 'alejandra' },
			rust = { 'rustfmt' },
			typst = { '' },
		},
		formatters = {
			['alejandra'] = {
				command = 'alejandra',
				prepend_args = { '--indent=4' },
			},
			['clang-format'] = {
				command = 'clang-format',
				prepend_args = { '--style={ColumnLimit: 0, IndentWidth: 4, TabWidth: 4}' },
			},
			['stylua'] = {
				command = 'stylua',
				prepend_args = {
					'--indent-type Spaces --indent-width 4 --quote-style AutoPreferSingle --call-parentheses Input',
				},
			},
		},
	}
end

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	once = true,
	callback = setup_conform,
})
