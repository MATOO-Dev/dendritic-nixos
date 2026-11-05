vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    once = true,
    callback = function()
        vim.cmd.packadd('blink.cmp')
        require 'blink.cmp'.setup {
            keymap = {
                preset = 'enter',
                ['k'] = { 'select_prev', 'fallback' },
                ['j'] = { 'select_next', 'fallback' },
                ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
            sources = { providers = { buffer = { enabled = false } } }, -- disable buffer source
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 }, -- auto show docs after 500ms
                ghost_text = { enabled = true }, -- virtual text preview
                keyword = { range = 'full' }, -- match before/after cursor, alternatively prefix for before only
                list = { selection = { preselect = false, auto_insert = true } }, -- auto insert to emulate better super tab
                trigger = { show_in_snippet = false }, -- super-tab recommendation
            },
        }
    end,
})
