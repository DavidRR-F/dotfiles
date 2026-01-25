local M = {}

M.config = function()
  vim.api.nvim_create_user_command("InitAppset", function(opts)
    local name = opts.args
    local common_src = vim.fn.expand("~/dev/frameworks/common")
    local appset_src = vim.fn.expand("~/dev/frameworks/" .. name)
    local common_dest = "./deploy/ci-temp-framework-common"
    local appset_dest = "./deploy/ci-temp-framework-app"

    local common_ok = os.execute(string.format("ln -s %s %s", common_src, common_dest))
    if common_ok == 0 then
      print("Symlink created: " .. common_dest .. " -> " .. common_src)
    else
      print("Failed to create symlink to common framework")
    end

    local appset_ok = os.execute(string.format("ln -s %s %s", appset_src, appset_dest))
    if appset_ok == 0 then
      print("Symlink created: " .. appset_dest .. " -> " .. appset_src)
    else
      print("Failed to create symlink to appset framework")
    end
  end, {
    nargs = 1,
    desc = "Symlink frameworks from ~/dev/frameworks to ./deploy",
    complete = function(_, _, _)
      local framework_dirs = vim.fn.glob("~/dev/frameworks/*", 1, 1)
      local results = {}
      for _, path in ipairs(framework_dirs) do
        if vim.fn.isdirectory(path) == 1 then
          table.insert(results, vim.fn.fnamemodify(path, ":t"))
        end
      end
      return results
    end
  })
end

return M
