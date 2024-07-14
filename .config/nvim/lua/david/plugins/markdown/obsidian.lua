return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  cmd = {
    'ObsidianOpen',
    'ObsidianNew',
    'ObsidianWorkspace',
    'ObsidianFollowLink',
    'ObsidianSearch',
    'ObsidianPasteImg',
  },
  opts = {
    workspaces = { "~/Documents/Obsidian" },
    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
    },
    attachments = {
      img_folder = "images",
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    }
  },
}
