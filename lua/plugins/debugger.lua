return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "C:\\Users\\d33pU\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
          args = { "--port", "${port}" },

          -- On windows you may have to uncomment this:
          -- detached = false,
        },
      }
      dap.configurations.c = {
        {
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          --program = '${fileDirname}/${fileBasenameNoExtension}',
          cwd = "${workspaceFolder}",
          terminal = "integrated",
        },
      }

      -- Keybindings for debugging
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })

      vim.keymap.set("n", "<leader>dr", function()
        dap.continue()
      end, { desc = "Start/Continue Debugging" })

      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, { desc = "Step Into" })

      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, { desc = "Step Over" })

      vim.keymap.set("n", "<leader>dq", function()
        dap.terminate()
      end, { desc = "Terminate Debugging" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
      })
    end,
  },
}
