local function setup_toggleterm()
    if not package.loaded['toggleterm.nvim'] then
        vim.cmd.packadd('toggleterm.nvim')
        require 'toggleterm'.setup {
            direction = 'float',
        }
    end
end

vim.keymap.set({ 'n' }, '<leader>tt', function()
    setup_toggleterm()
    require 'toggleterm'.toggle()
end, { desc = '[T]oggle[T]erm' })

vim.keymap.set({ 't' }, '<esc><esc>', function()
    setup_toggleterm()
    require 'toggleterm'.toggle()
end, { desc = '[T]oggle[T]erm' })

-- disallow lazygit shortcut in terminal mode
-- this mans lazygit needs to be dismissed using q rather than toggled
-- but it stops it from acting weird. toggle still works in regular toggleterm
vim.keymap.set('n', '<leader>lg', function()
    setup_toggleterm()
    require 'toggleterm.terminal'.Terminal:new({ cmd = 'lazygit', hidden = true }):open()
end, { desc = '[L]azy[G]it' })
