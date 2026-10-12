return{
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
    },
    config=function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- 1. Initialize Virtual Text helper (adds inline variable previews)
        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        -- 2. Configure mason-nvim-dap to ignore gdb since you are defining it manually
        require("mason-nvim-dap").setup({
            ensure_installed = {}, 
            handlers = {},
        })

        -- 3. Define your Native GDB Adapter
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }

        -- 4. Tell DAP how to use the adapter for C++
        dap.configurations.cpp = {
            {
                name = "Launch C++ File",
                type = "gdb", 
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                runInTerminal = false,
            },
        }
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.after.event_initialized.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end
}
