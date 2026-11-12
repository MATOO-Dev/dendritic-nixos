local function setup_treesj()
    if package.loaded['treesj'] then
        return
    end

    vim.cmd.packadd('treesj')
    require 'treesj'.setup {}
end

vim.keymap.set('n', '<leader>tj', function()
    setup_treesj()
    require 'treesj'.toggle()
end, { desc = '[T]oggle [J]oin' })
