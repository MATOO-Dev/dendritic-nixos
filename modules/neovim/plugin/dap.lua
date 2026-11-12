local function pick_executable(suffix)
    setup_snacks()
    return coroutine.create(function(coro)
        require 'snacks'.picker {
            title = 'Select executable (async):',
            finder = 'proc',
            cmd = 'fd',
            args = {
                '--hidden',
                '--no-ignore',
                '--type',
                'x',
                '--max-depth',
                '1',
                '--search-path',
                (suffix or ''),
            },
            transform = function(item)
                item.file = item.text
            end,
            confirm = function(picker, item)
                picker:close()
                coroutine.resume(coro, item.file)
            end,
        }
    end)
end

local function setup_dap()
    if package.loaded['nvim-dap'] then
        return
    end

    vim.cmd.packadd 'nvim-dap'
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticOk' })

    vim.cmd.packadd 'nvim-dap-view'
    require 'dap-view'.setup {
        auto_toggle = true,
        follow_tab = true,
        winbar = { controls = { enabled = true } },
        windows = { size = 0.4, position = 'right' },
    }
    vim.opt.winfixbuf = false

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
            initCommands = function()
                local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
                assert(vim.v.shell_error == 0, 'Failed to get sysroot using `rustc --print sysroot`: ' .. rustc_sysroot)
                local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
                local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
                return {
                    ([[!command script import '%s']]):format(script_file),
                    ([[!command source '%s']]):format(commands_file),
                }
            end,
            program = pick_executable('target/debug'),
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    }

    dap.configurations.cpp = {
        {
            name = 'Launch Cpp',
            type = 'lldb',
            request = 'launch',
            program = pick_executable(),
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
    require 'dap'.step_out()
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
