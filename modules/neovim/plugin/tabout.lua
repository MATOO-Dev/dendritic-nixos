-- if this behaves weird, consider testing neotab.nvim
vim.api.nvim_create_autocmd('InsertEnter', {
    once = true,
    callback = function()
        vim.cmd.packadd('tabout.nvim')
        require 'tabout'.setup {}
    end,
})
