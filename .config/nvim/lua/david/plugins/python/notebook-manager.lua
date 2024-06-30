return {
  dir = "/home/davidrrf/Dev/notebook-manager/kernel-menu",
  name = "notebook-manager",
  --"DavidRR-F/notebook-manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "CreateBook",
    "DeleteBook",
    "CreateKernel",
    "DeleteKernel",
    "KernelMenu",
  },
  opts = {
    notebook_dir = "./notebooks",
    kernel_dir = "default",
    ignore_package_manager = false,
  },
  keys = {
    { "<leader>km", "<cmd>:KernelMenu<cr>", desc = "Show Kernels" },
  },
}
