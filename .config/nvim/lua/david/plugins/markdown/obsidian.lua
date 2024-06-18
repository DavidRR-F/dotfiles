local function configure_obsidian_vaults()
    local uv = vim.loop
    local main_obsidian_directory = uv.os_homedir() .. '/Documents/Obsidian'
    local vaults = {}
    local dirs = uv.fs_scandir(main_obsidian_directory)
    if not dirs then
        print("Error opening directory:", main_obsidian_directory)
        return {}
    end
    while true do
        local name, type = uv.fs_scandir_next(dirs)
        if not name then break end
        local full_path = main_obsidian_directory .. '/' .. name
        if type == 'directory' and uv.fs_stat(full_path .. '/.obsidian') then
            table.insert(vaults, {name = name, path = full_path})
        end
    end
   
    return vaults
end

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
    workspaces = configure_obsidian_vaults(),
    note_id_func = function(title)
      return title
    end,
    callbacks = {
      post_set_workspace = function(_, workspace)
        local new_dir = workspace.path.filename
        vim.fn.chdir(new_dir)
        print("Changed directory to " .. new_dir)
      end
    }
  },
}
