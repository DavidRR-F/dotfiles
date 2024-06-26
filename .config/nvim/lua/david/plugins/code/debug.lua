local plugins = {
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      opts = {
        n = {
          ["<leader>db"] = { require("dap").toggle_breakpoint, "Toggle breakpoint" },
          ["<leader>dc"] = { require("dap").continue, "Continue" },
          ["<leader>dl"] = { require("dap").run_last, "Run last" },
        }
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}

return plugins
