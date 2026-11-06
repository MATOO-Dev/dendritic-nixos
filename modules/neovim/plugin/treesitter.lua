local function setup_treesitter()
    if not package.loaded['nvim-treesitter'] then
        vim.cmd.packadd 'nvim-treesitter'
        require 'nvim-treesitter'.setup {
            -- grammars are supplied via nixpkgs
            auto_install = false,
        }

        vim.cmd.packadd 'nvim-treesitter-textobjects'
        require 'nvim-treesitter-textobjects'.setup {
            select = {
                lookahead = true,
            },
        }

        local select = function(query)
            return function()
                require 'nvim-treesitter-textobjects.select'.select_textobject(query, 'textobjects')
            end
        end

        -- select inside/around functions
        vim.keymap.set({ 'x', 'o' }, 'af', select('@function.outer'))
        vim.keymap.set({ 'x', 'o' }, 'if', select('@function.inner'))

        -- select inside/around classes
        vim.keymap.set({ 'x', 'o' }, 'ac', select('@class.outer'))
        vim.keymap.set({ 'x', 'o' }, 'ic', select('@class.inner'))

        -- select inside/around function arguments / parameters
        vim.keymap.set({ 'x', 'o' }, 'aa', select('@parameter.outer'))
        vim.keymap.set({ 'x', 'o' }, 'ia', select('@parameter.inner'))

        -- select inside/around blocks
        vim.keymap.set({ 'x', 'o' }, 'ab', select('@block.outer'))
        vim.keymap.set({ 'x', 'o' }, 'ib', select('@block.inner'))

        local move = function(key, query, method)
            vim.keymap.set({ 'n', 'x', 'o' }, ']' .. key, function()
                require 'nvim-treesitter-textobjects.move'['goto_next_' .. method](query, 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[' .. key, function()
                require 'nvim-treesitter-textobjects.move'['goto_previous_' .. method](query, 'textobjects')
            end)
        end

        move('f', '@function.outer', 'start')
        move('F', '@function.outer', 'end')
        move('c', '@class.outer', 'start')
        move('C', '@class.outer', 'end')
        move('a', '@parameter.outer', 'start')
        move('A', '@parameter.outer', 'end')
        move('b', '@block.outer', 'start')
        move('B', '@block.outer', 'end')
    end
end

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        setup_treesitter()
        pcall(vim.treesitter.start, args.buf)
    end,
})
