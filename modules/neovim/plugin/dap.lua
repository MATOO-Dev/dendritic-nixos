local function setup_dap()
    if not package.loaded['nvim-dap'] then
        vim.cmd.packadd 'nvim-dap'
        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticOk' })

        vim.cmd.packadd 'nvim-dap-view'
        require 'dap-view'.setup {
            auto_toggle = true,
            follow_tab = true,
            winbar = { controls = { enabled = true } },
            windows = { position = 'right' },
        }

        vim.cmd.packadd 'nvim-dap-virtual-text'
        require 'nvim-dap-virtual-text'.setup {}

        local dap = require 'dap'

        dap.adapters.lldb = {
            name = 'lldb',
            type = 'executable',
            command = vim.fn.exepath('lldb-dap'),
        }

        dap.configurations.rust = {
            {
                name = 'Launch Rust',
                type = 'lldb',
                request = 'launch',
                program = function()
                    -- vim.fn.jobstart('cargo build')
                    -- return vim.fn.getcwd() .. '/target/debug/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                    return vim.fn.input('Executable: ', vim.fn.getcwd() .. '/target/debug')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.configurations.cpp = {
            {
                name = 'Launch Cpp',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.adapters.godot = {
            type = 'server',
            host = 'localhost',
            port = 6006,
        }

        dap.configurations.gdscript = {
            {
                type = 'godot',
                request = 'launch',
                name = 'Launch godot scene',
                project = '${workspaceFolder}',
                launch_scene = true,
            },
        }
    end
end

vim.keymap.set('n', '<leader>dc', function()
    setup_dap()
    require 'dap'.continue()
end, { desc = '[D]ebug [C]ontinue' })

vim.keymap.set('n', '<leader>dk', function()
    setup_dap()
    require 'dap'.terminate()
end, { desc = '[D]ebug [K]ill' })

vim.keymap.set('n', '<leader>dr', function()
    setup_dap()
    require 'dap'.restart()
end, { desc = '[D]ebug [R]estart' })

vim.keymap.set('n', '<leader>do', function()
    setup_dap()
    require 'dap'.step_over()
end, { desc = '[D]ebug step [O]ver' })

vim.keymap.set('n', '<leader>di', function()
    setup_dap()
    require 'dap'.step_into()
end, { desc = '[D]ebug step [I]nto' })

vim.keymap.set('n', '<leader>du', function()
    setup_dap()
    require 'dap'.setp_out()
end, { desc = '[D]ebug step o[U]t' })

vim.keymap.set('n', '<leader>dl', function()
    setup_dap()
    require 'dap'.run_last()
end, { desc = '[D]ebug [L]ast' })

vim.keymap.set('n', '<leader>dv', function()
    setup_dap()
    require 'dap-view'.toggle()
end, { desc = '[D]ebug toggle [V]iew' })

vim.keymap.set('n', '<leader>db', function()
    setup_dap()
    vim.cmd.DapToggleBreakpoint()
end, { desc = '[D]ebug [B]reakpoint' })
