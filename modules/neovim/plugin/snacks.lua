function _G.setup_snacks()
    if package.loaded['snacks'] then
        return
    end

    vim.cmd.packadd 'snacks.nvim'
    require 'snacks'.setup {
        image = { enabled = true },
        picker = {
            enabled = true,
            matcher = { frecency = true, history_bonus = true },
            layout = { preset = 'default' }, -- also consider ivy or telescope
        },
    }
end

vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = setup_snacks,
})

vim.keymap.set('n', '<leader>ff', function()
    setup_snacks()
    require 'snacks'.picker.files()
end, { desc = '[F]ind [F]iles' })

vim.keymap.set('n', '<leader>fg', function()
    setup_snacks()
    require 'snacks'.picker.grep()
end, { desc = '[F]ind [G]rep' })

vim.keymap.set('n', '<leader>fb', function()
    setup_snacks()
    require 'snacks'.picker.buffers()
end, { desc = '[F]ind [B]uffers' })

vim.keymap.set('n', '<leader>fd', function()
    setup_snacks()
    require 'snacks'.picker.diagnostics()
end, { desc = '[F]ind [D]iagnostics' })

vim.keymap.set('n', '<leader>fm', function()
    setup_snacks()
    require 'snacks'.picker.marks()
end, { desc = '[F]ind [M]arks' })

vim.keymap.set('n', '<leader>fl', function()
    setup_snacks()
    require 'snacks'.picker.lsp_symbols()
end, { desc = '[F]ind [L]sp Symbols' })
