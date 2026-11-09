-- always enable lsp when one of these markers detected
vim.lsp.config('*', {
    root_markers = { '.git' },
})

-- show virtual inline signatures
vim.lsp.inlay_hint.enable(false)

-- load default configs
vim.cmd.packadd('nvim-lspconfig')

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
-- glsl_analyzer currently does not support error checking
vim.lsp.enable('glsl_analyzer')

-- hlsl + slang
vim.lsp.enable('slangd')

-- lua
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enabled = false },
        },
    },
})

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
