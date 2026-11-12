-- local function setup_xyz()
--     if package.loaded['plugin'] then
--         return
--     end
--
--     vim.cmd.packadd 'plugin'
--     require 'plugin'.setup {}
-- end

-- vim.api.nvim_create_autocmd('event', {
--     once = true,
--     callback = setup_xyz,
-- })

-- vim.keymap.set('n', 'keybind', function()
--     setup_xyz()
--     require 'plugin'.do_stuff()
--     -- alternatively for some vimscript plugins
--     vim.cmd.do_stuff()
-- end, { desc = 'my plugin keybind' })
