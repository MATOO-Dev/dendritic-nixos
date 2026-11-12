local function setup_oil()
    if package.loaded['oil'] then
        return
    end
    vim.cmd.packadd('oil.nvim')
    require 'oil'.setup {
        default_file_explorer = true,
        delete_to_trash = true,
        view_options = { show_hidden = true },
        columns = { 'icon' },
        use_default_keymaps = true,
        keymaps = { ['<bs>'] = 'actions.parent' },
    }
    vim.cmd.packadd 'oil-git.nvim'
    require 'oil-git'.setup {}
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    once = true,
    callback = setup_oil,
})

vim.keymap.set('n', '<leader>ol', function()
    setup_oil()
    require 'oil'.open()
end, { desc = '[O]i[L]' })
