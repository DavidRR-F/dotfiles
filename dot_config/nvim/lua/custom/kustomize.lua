local M = {}

local function floating_doc_window(opts)
  if not opts.output then
    vim.notify("No output to display", vim.log.levels.ERROR)
    return
  end

  for i, line in ipairs(opts.output) do
    opts.output[i] = line:gsub("\r", "")
  end

  table.insert(opts.output, 1, opts.name)

  Snacks.win({
    text = opts.output,
    width = 0.6,
    height = 0.8,
    border = "rounded",
    backdrop = 50,
    resize = true,
    fixbuf = true,
    ft = "yaml",
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
    keys = {
      q = "close"
    },
  })
end

M.config = function()
  vim.api.nvim_create_user_command("KustomizeBuild", function(opts)
    local overlay = opts.args

    local cmd = "kustomize build ./deploy/kustomize/overlays/" .. overlay .. " --enable-helm"
    local output = vim.fn.systemlist(cmd)

    if vim.v.shell_error ~= 0 then
      vim.notify("Error: Could not run kustomize build\n" + output, vim.log.levels.ERROR)
      return
    end

    floating_doc_window({
      output = output,
      args = opts.args,
      name = "# Kustomize Build: " .. overlay,
      filetype = "yaml",
    })
  end, {
    nargs = 1,
    desc = "kustomize build manaifest view",
    complete = function(_, _, _)
      local overlay_dirs = vim.fn.glob("./deploy/kustomize/overlays/*", 1, 1)
      local results = {}
      for _, path in ipairs(overlay_dirs) do
        if vim.fn.isdirectory(path) == 1 then
          table.insert(results, vim.fn.fnamemodify(path, ":t"))
        end
      end
      return results
    end
  })
end

return M
