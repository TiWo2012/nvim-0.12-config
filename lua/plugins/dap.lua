return {
    -- Mason base
    {
        "williamboman/mason.nvim",
        config = true,
    },

    -- Mason DAP bridge (IMPORTANT)
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason-nvim-dap").setup({
                automatic_setup = true,
                ensure_installed = {
                    "codelldb",
                    "debugpy",
                },

                handlers = {
                    -- IMPORTANT FIX:
                    codelldb = function()
                        local dap = require("dap")

                        require("mason-nvim-dap").default_setup("codelldb")

                        -- Force correct adapter (prevents lldb-vscode fallback)
                        dap.adapters.codelldb = {
                            type = "server",
                            port = "${port}",
                            executable = {
                                command = vim.fn.stdpath("data")
                                    .. "/mason/packages/codelldb/extension/adapter/codelldb",
                                args = { "--port", "${port}" },
                            },
                        }
                    end,
                },
            })
        end,
    },

    -- DAP core
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- Start / continue
            vim.keymap.set("n", "<F5>", function()
                if dap.session() then
                    dap.continue()
                else
                    dap.run_last()
                end
            end, { desc = "DAP Start/Continue" })

            -- Stepping
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })

            -- Breakpoints
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Condition: "))
            end)

            -- IMPORTANT: configs must exist
            local last_args = {}

            dap.configurations.cpp = {
                {
                    name = "Launch with args",
                    type = "codelldb",
                    request = "launch",

                    program = function()
                        local cwd = vim.fn.getcwd()

                        vim.g.dap_last_exec = vim.g.dap_last_exec or {}

                        local default = vim.g.dap_last_exec[cwd] or (cwd .. "/build/app")

                        local input = vim.fn.input("Executable: ", default, "file")

                        local exec = input ~= "" and input or default

                        vim.g.dap_last_exec[cwd] = exec

                        return exec
                    end,

                    args = function()
                        local input = vim.fn.input("Args: ", table.concat(last_args, " "))
                        last_args = vim.split(input, " ")
                        return last_args
                    end,

                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- auto open/close
            dap.listeners.after.event_initialized["dapui"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui"] = function()
                dapui.close()
            end

            -- keymaps
            vim.keymap.set("n", "<leader>do", dapui.open, { desc = "DAP UI Open" })
            vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "DAP UI Close" })
        end,
    }
}
