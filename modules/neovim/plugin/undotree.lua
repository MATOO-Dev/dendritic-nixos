local function setup_undotree()
    if package.loaded['nvim.undotree'] then
        return
    end

    -- this is a test using the native undotree
    vim.cmd.packadd('nvim.undotree')
end

vim.keymap.set('n', '<leader>ut', function()
    setup_undotree()
    require 'undotree'.open()
end, { desc = '[U]ndotree [T]oggle' })
