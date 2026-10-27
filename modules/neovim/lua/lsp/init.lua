vim.lsp.config('*', {
	root_markers = { '.git' },
})

vim.cmd.packadd('nvim-lspconfig')

-- inline errors
vim.diagnostic.config({ virtual_text = true })

-- bash
vim.lsp.enable('bashls')
-- c / c++
vim.lsp.enable('clangd')
-- cmake
vim.lsp.enable('cmake')
-- c#
vim.lsp.enable('csharp_ls')
-- gdscript, lsp is localhost connection to godot client, so no lsp package
vim.lsp.enable('gdscript')
-- gdshader, unmaintained, consider packaging gdshader-lsp-cpp
-- vim.lsp.enable('gdshader_lsp')
-- glsl
vim.lsp.enable('glsl_analyzer')
-- hlsl + slang
vim.lsp.enable('slangd')
-- lua
vim.lsp.enable('lua_ls')
-- markdown
vim.lsp.enable('marksman')
-- nix
vim.lsp.enable('nil_ls') -- consider testing nixd
-- rust
vim.lsp.enable('rust_analyzer')
-- typst
vim.lsp.enable('tinymist')
-- wgsl
vim.lsp.enable('wgsl_analyzer')

-- basic, plugin-less completions
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autoTrigger = true })
		end
	end,
})
