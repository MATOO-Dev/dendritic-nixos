local function setup_snacks()
    if package.loaded['snacks.nvim'] then
        return
    end

    vim.cmd.packadd 'snacks.nvim'
    require 'snacks'.setup {
        image = { enabled = true },
    }
end

vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = setup_snacks,
})

-- vim.keymap.set('n', 'keybind', function()
--     setup_snacks()
--     require 'plugin'.do_stuff()
--     -- alternatively for some vimscript plugins
--     vim.cmd.do_stuff()
-- end, { desc = 'my plugin keybind' })
