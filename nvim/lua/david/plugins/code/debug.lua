return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go"
  },
  lazy = true,
  config = function()
    -- Keys

    vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>DapToggleBreakpoint<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>DapContinue<CR>', { noremap = true, silent = true })

    -- Language Adapters

    local os = require('david.custom.os')
    require('dap-python').setup(os.settings.python_host)
    require('dap-go').setup()

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
