local function setup_toggleterm()
    if not package.loaded['toggleterm.nvim'] then
        vim.cmd.packadd('toggleterm.nvim')
        require 'toggleterm'.setup {
            direction = 'float',
        }
    end
end

vim.keymap.set({ 'n', 't' }, '<leader>tt', function()
    setup_toggleterm()
    require 'toggleterm'.toggle()
end, { desc = '[T]oggle[T]erm' })

-- local Terminal  = require('toggleterm.terminal').Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
-- function _lazygit_toggle()
--   lazygit:toggle()
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
