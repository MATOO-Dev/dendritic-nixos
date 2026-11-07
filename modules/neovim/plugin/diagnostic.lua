local function setup_diagnostic()
    if not package.loaded['tiny-inline-diagnostic'] then
        vim.cmd.packadd('tiny-inline-diagnostic.nvim')
        require 'tiny-inline-diagnostic'.setup {
            preset = 'powerline',
            options = {
                enable_on_insert = true,
                enable_on_select = true,
                show_source = false,
                multilines = {
                    enabled = true,
                    always_show = true,
                },
            },
        }
        vim.diagnostic.config({
            update_in_insert = true,
            severity_sort = true,
            virtual_lines = false,
            virtual_text = false,
            underline = true,
            signs = false,
        })
    end
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    once = true,
    callback = setup_diagnostic,
})

vim.keymap.set('n', '<leader>ti', function()
    setup_diagnostic()
    require 'tiny-inline-diagnostic'.toggle()
    local virt = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = not virt })
end, { desc = '[T]oggle [I]nline diagnostic' })
