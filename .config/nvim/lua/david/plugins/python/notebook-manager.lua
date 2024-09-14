return {
  "DavidRR-F/notebook-manager.nvim",
  dependencies = {
    "vim-telescope/telescope.nvim",
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
}
