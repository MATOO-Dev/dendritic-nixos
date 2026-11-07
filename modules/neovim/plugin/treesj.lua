vim.keymap.set('n', '<leader>tj', function()
    if not package.loaded['treesj'] then
        vim.cmd.packadd('treesj')
        require 'treesj'.setup {}
    end
    require 'treesj'.toggle()
end, { desc = '[T]oggle [J]oin' })
