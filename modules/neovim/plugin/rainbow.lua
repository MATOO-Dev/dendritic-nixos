local function setup_rainbow()
    local highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowViolet',
        'RainbowCyan',
        'RainbowGreen',
        'RainbowOrange',
    }

    vim.cmd.packadd('indent-blankline.nvim')
    local hooks = require 'ibl.hooks'

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
    end)

    require 'ibl'.setup {
        indent = { highlight = highlight },
        scope = {
            highlight = highlight,
            show_start = true,
            show_end = true,
            show_exact_scope = false,
            -- include = {
            --     node_type = {
            --         lua = { 'table_constructor' },
            --         nix = {
            --             'attrset_expression',
            --             'list_expression',
            --         },
            --         rust = {
            --             'if_expression',
            --             'match_expression',
            --             'loop_expression',
            --             'while_expression',
            --             'for_expression',
            --             'closure_expression',
            --             'call_expression',
            --             'field_expression',
            --         },
            --     },
            -- },
        },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    vim.cmd.packadd('rainbow-delimiters.nvim')
    vim.g.rainbow_delimiters = { highlight = highlight }
end

vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
    callback = setup_rainbow,
})
