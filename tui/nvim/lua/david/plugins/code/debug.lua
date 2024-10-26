return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "stevearc/dressing.nvim",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python"
  },
  config = function()
    -- Keys

    vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>DapToggleBreakpoint<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>DapContinue<CR>', { noremap = true, silent = true })

    -- Language Adapters

    local os = require('david.custom.os').get_os_settings()
    require('dap-python').setup(os.python_host)

    -- UI Setup
    vim.fn.sign_define('DapBreakpoint', {text='', texthl='DiagnosticSignError', linehl='', numhl=''})
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
  end
}
