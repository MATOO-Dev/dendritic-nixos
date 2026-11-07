vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    once = true,
    callback = function()
        vim.cmd.packadd('blink.cmp')
        require 'blink.cmp'.setup {
            keymap = {
                preset = 'enter',
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

local function setup_blinkextra()
    local function add_suffix(list, suffix)
        local result = {}
        for i, value in ipairs(list) do
            result[i] = value .. suffix
        end
        return result
    end

    local colors = {
        'BlinkIndentOrange',
        'BlinkIndentViolet',
        'BlinkIndentBlue',
        'BlinkIndentCyan',
        'BlinkIndentRed',
    }

    -- required to enable colors in cmdline
    require 'vim._core.ui2'.enable {}

    vim.cmd.packadd('blink.indent')
    require 'blink.indent'.setup {
        scope = {
            highlights = colors,
            underline = {
                enabled = true,
                highlights = add_suffix(colors, 'Underline'),
            },
        },
    }

    vim.cmd.packadd('blink.pairs')
    require 'blink.pairs'.setup {
        mappings = {
            enabled = true,
            cmdline = true,
            wrap = {
                -- when in insert mode, move wrap to contain indicated motion
                -- works great with flash.nvim
                ['<C-b>'] = 'motion',
                ['<C-S-b>'] = 'motion_reverse',
            },
            pairs = {},
        },
        highlights = {
            enabled = true,
            cmdline = true,
            groups = colors,
            matchparen = {
                enabled = true,
                cmdline = true,
                include_surrounding = false,
            },
        },
    }
end

vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = setup_blinkextra,
})
