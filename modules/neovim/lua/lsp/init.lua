vim.lsp.config('*', {
	root_markers = { '.git' },
})

vim.cmd.packadd('nvim-lspconfig')

vim.lsp.enable('rust_analyzer')
-- vim.lsp.config('rust_analyzer', {})
