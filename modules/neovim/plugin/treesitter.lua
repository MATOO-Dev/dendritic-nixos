local function setup_treesitter()
    if not package.loaded['nvim-treesitter'] then
        vim.cmd.packadd 'nvim-treesitter'
        require 'nvim-treesitter'.setup {
            -- grammars are supplied via nixpkgs
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
        }
        vim.cmd.packadd 'nvim-treesitter-textobjects'
        require 'nvim-treesitter-textobjects'.setup {
            -- textobjects config here
        }
    end
end

vim.api.nvim_create_autocmd({ 'FileType' }, {
    callback = setup_treesitter,
})
