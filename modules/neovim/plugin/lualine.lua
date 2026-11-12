local function setup_lualine()
    if package.loaded['lualine.nvim'] then
        return
    end

    vim.cmd.packadd('lualine.nvim')
    -- nvim-web-devicons is already supplied by oil which always loads before
    require 'lualine'.setup {
        options = {
            theme = 'auto',
            icons_enabled = true,
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
                'mode',
                {
                    'macro',
                    fmt = function()
                        local register = vim.fn.reg_recording()
                        if register ~= '' then
                            return 'Recording @' .. register
                        end
                        return nil
                    end,
                },
            },
            lualine_b = { 'diagnostics' },
            lualine_c = { 'buffers' },
            lualine_x = { 'filetype' },
            lualine_y = { 'branch' },
            lualine_z = { 'location' },
        },
    }
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    once = true,
    callback = setup_lualine,
})
