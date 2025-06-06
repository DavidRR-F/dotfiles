return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim"
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = vim.g.lang.mason.dap,
        automatic_installation = true
      })
    end
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    config = function()
      local dap = require("dap")
      for _, config_path in pairs(vim.g.lang.config_paths) do
        local success, code = pcall(require, config_path)

        if success and code.dap then
          dap.adapters[code.name.dap.adapter] = code.dap.adapter
          dap.configurations[code.name.dap.config] = code.dap.config
        end
      end
      vim.fn.sign_define('DapBreakpoint', {text='󰻃', texthl='DiagnosticSignInfo', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointCondition', {text='󰐙', texthl='DiagnosticSignInfo', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DiagnosticSignError', linehl='', numhl=''})
      vim.fn.sign_define('DapLogPoint', {text='󰣕', texthl='DiagnosticSignWarn', linehl='', numhl=''})
      vim.fn.sign_define('DapStopped', {text='󰁗', texthl='DiagnosticSignWarn', linehl='', numhl=''})
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text"
    },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      require("nvim-dap-virtual-text").setup()
      dap.listeners.before.attach.dapui_config = function()
          dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
          dapui.open()
      end
      dap.listeners.before.event_initialized.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
    end
  }
}
