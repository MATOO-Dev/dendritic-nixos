local function setup_undotree()
    if package.loaded['nvim.undotree'] then
        return
    end

    vim.cmd.packadd('nvim.undotree')
end

-- TODO: test using native undotree rather than plugin
vim.keymap.set('n', '<leader>ut', function()
    setup_undotree()
    require 'undotree'.open()
end, { desc = '[U]ndotree [T]oggle' })
