-- tiny-cmdline.nvim auto-initalizes on UIEnter
require 'vim._core.ui2'.enable {}
vim.o.cmdheight = 0
vim.cmd.packadd('tiny-cmdline.nvim')

-- configuration via setup
require 'tiny-cmdline'.setup {
    on_reposition = require 'tiny-cmdline'.adapters.blink,
    width = { value = '70%' },
    border = nil,
}
