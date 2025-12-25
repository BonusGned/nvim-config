return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio", -- Required for dap-ui
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup()

        -- Automatically open/close UI when debugging starts/ends
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Python setup (using debugpy from Mason)
        -- Mason installs packages in stdpath("data")/mason
        local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)

        -- Keymaps
        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<F5>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F6>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Debug: Step Out" })
        vim.keymap.set("n", "<Leader>dr", dap.restart, { desc = "Debug: Restart" })
        vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Debug: Terminate" })
    end,
}
