local main_obsidian_directory = vim.loop.os_homedir() .. '/Documents/Obsidian'

local function is_subdirectory(parent, child)
  -- Normalize paths by removing trailing slashes
  local function normalize_path(path)
    return path:gsub("/+$", "")
  end

  parent = normalize_path(parent)
  child = normalize_path(child)

  -- Check if child path starts with the parent path
  return child:sub(1, #parent) == parent
end

local function configure_obsidian_vaults()
  local uv = vim.loop
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
      table.insert(vaults, { name = name, path = full_path })
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
        if is_subdirectory(main_obsidian_directory, new_dir) then
          vim.fn.chdir(new_dir)
          print("Changed directory to " .. new_dir)
        end
      end
    }
  },
}
