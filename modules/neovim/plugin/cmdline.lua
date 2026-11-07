-- tiny-cmdline.nvim auto-initalizes on UIEnter
vim.o.cmdheight = 0
vim.cmd.packadd('tiny-cmdline.nvim')

-- configuration via setup
require 'tiny-cmdline'.setup {
    on_reposition = require 'tiny-cmdline'.adapters.blink,
}
