local function setup_whichkey()
    if package.loaded['which-key.nvim'] then
        return
    end

    vim.cmd.packadd 'which-key.nvim'
end

vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = setup_whichkey,
})

vim.keymap.set('n', '<leader>?', function()
    setup_whichkey()
    require 'which-key'.show { global = false }
end, { desc = 'my plugin keybind' })
