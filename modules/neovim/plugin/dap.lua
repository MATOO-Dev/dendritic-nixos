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

vim.keymap.set('n', '<f5>', function()
    setup_dap()
    vim.cmd.DapContinue()
end, { desc = 'Debug: continue' })

vim.keymap.set('n', '<s-f5>', function()
    setup_dap()
    vim.cmd.DapStop()
end, { desc = 'Debug: stop' })

vim.keymap.set('n', '<c-s-f5>', function()
    setup_dap()
    vim.cmd.DapRestart()
end, { desc = 'Debug: restart' })

vim.keymap.set('n', '<f11>', function()
    setup_dap()
    vim.cmd.DapStepOver()
end, { desc = 'Debug: step over' })

vim.keymap.set('n', '<f12>', function()
    setup_dap()
    vim.cmd.DapStepInto()
end, { desc = 'Debug: into' })

vim.keymap.set('n', '<s-f12>', function()
    setup_dap()
    vim.cmd.DapStepOut()
end, { desc = 'Debug: step out' })

vim.keymap.set('n', '<leader>b', function()
    setup_dap()
    vim.cmd.DapToggleBreakpoint()
end, { desc = 'Debug: toggle breakpoint' })
