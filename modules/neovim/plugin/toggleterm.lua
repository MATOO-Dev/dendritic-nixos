local function setup_toggleterm()
    if not package.loaded['toggleterm.nvim'] then
        vim.cmd.packadd('toggleterm.nvim')
        require 'toggleterm'.setup {
            -- toggleterm sets its keybind via setup, rather than vim.keymap.set
            open_mapping = '<leader>tt',
            direction = 'float',
        }
    end
end

vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
        setup_toggleterm()
    end,
})
