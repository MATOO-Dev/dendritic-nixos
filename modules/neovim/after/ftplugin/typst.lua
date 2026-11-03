vim.opt_local.wrap = true

if not package.loaded['typst-preview.nvim'] then
	vim.cmd.packadd('typst-preview.nvim')
	require 'typst-preview'.setup {}
end

vim.cmd.TypstPreview()
