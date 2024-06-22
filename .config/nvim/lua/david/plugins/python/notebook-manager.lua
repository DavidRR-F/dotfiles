return {
  "DavidRR-F/notebook-manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "CreateBook",
    "DeleteBook",
    "CreateKernel",
    "DeleteKernel",
    "ShowKernels",
  },
  opts = {
    notebook_dir = "./notebooks",
    kernel_dir = "default",
  },
  keys = {
    { "<leader>km", "<cmd>:ShowKernels<cr>", desc = "Show Kernels" },
  },
}
