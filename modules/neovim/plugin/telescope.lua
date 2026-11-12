function _G.setup_telescope()
    if not package.loaded['telescope'] then
        vim.cmd.packadd('telescope.nvim')
        require 'telescope'.setup {}
    end
end

vim.keymap.set('n', '<leader>ff', function()
    setup_telescope()
    require 'telescope.builtin'.find_files()
end, { desc = 'Telescope [F]ind [F]iles' })

vim.keymap.set('n', '<leader>fg', function()
    setup_telescope()
    require 'telescope.builtin'.live_grep()
end, { desc = 'Telescope [F]ind [G]rep' })

vim.keymap.set('n', '<leader>fb', function()
    setup_telescope()
    require 'telescope.builtin'.buffers()
end, { desc = 'Telescope [F]ind [B]uffers' })
