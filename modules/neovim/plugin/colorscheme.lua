local function setup_catppuccin()
    if package.loaded['catppuccin'] then
        return
    end

    vim.cmd.packadd('catppuccin')
    require 'catppuccin'.setup {
        background = { dark = 'macchiato' },
        transparent_background = true,
    }
    vim.cmd.colorscheme 'catppuccin'
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    once = true,
    callback = setup_catppuccin,
})
