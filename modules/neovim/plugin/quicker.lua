local context = 1
local expand = 2

local function setup_quicker()
    if package.loaded['quicker.nvim'] then
        return
    end

    vim.cmd.packadd 'quicker.nvim'
    require 'quicker'.setup {
        keys = {
            {
                '>',
                function()
                    context = context + 1
                    require('quicker').expand({ before = expand, after = expand, add_to_existing = true })
                end,
                desc = 'Expand quickfix context',
            },
            {
                '<',
                function()
                    context = math.max(1, math.min(context - 1, 10)) -- math.clamp(context - 1, 1, 10)
                    if context == 1 then
                        require('quicker').collapse()
                    else
                        require('quicker').expand({ before = -expand, after = -expand, add_to_existing = true })
                    end
                end,
                desc = 'Collapse quickfix context',
            },
        },
    }
    vim.cmd.packadd 'nvim-bqf'
    require 'bqf'.setup {
        auto_resize_height = true,
        preview = { winblend = 0 },
    }
end

vim.api.nvim_create_autocmd('FileType', {
    once = true,
    pattern = 'qf', -- on quickfix window open
    callback = setup_quicker,
})

-- weird map, but im used to <leader>q to quit buffer
-- <leader>qq or <leader>ql would add delay to that
vim.keymap.set('n', '<leader>fl', function()
    setup_quicker()
    require 'quicker'.toggle { focus = true }
end, { desc = 'Toggle quick[F]ix [L]ist' })

vim.keymap.set('n', '<leader>ll', function()
    setup_quicker()
    require 'quicker'.toggle { loclist = true }
end, { desc = 'Toggle [L]oc[L]ist' })
