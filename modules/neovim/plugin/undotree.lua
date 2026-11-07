-- vim.keymap.set('n', '<leader>ut', function()
-- 	if vim.fn.exists(':UndotreeToggle') == 0 then
-- 		vim.cmd.packadd('undotree')
-- 	end
-- 	vim.cmd.UndotreeToggle()
-- 	vim.cmd.UndotreeFocus()
-- end, { desc = '[U]ndotree [T]oggle' })

-- test using native undotree rather than plugin
vim.keymap.set('n', '<leader>ut', function()
    if not package.loaded['nvim.undotree'] then
        vim.cmd.packadd('nvim.undotree')
    end
    require 'undotree'.open()
end, { desc = '[U]ndotree [T]oggle' })
