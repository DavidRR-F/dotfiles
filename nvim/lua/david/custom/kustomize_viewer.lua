local M = {}

local function floating_doc_window(opts)
    -- Ensure opts.output is valid and has sufficient lines
    if not opts.output then
        vim.notify("No output to display", vim.log.levels.ERROR)
        return
    end

    -- Clean lines of carriage return characters
    for i, line in ipairs(opts.output) do
        opts.output[i] = line:gsub("\r", "")
    end

    table.insert(opts.output, 1, opts.name)

    Snacks.win({
      text = opts.output,
      width = 0.4,
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
    vim.api.nvim_create_user_command("Kustomize", function(opts)
        local cwd = vim.fn.getcwd()  -- Get the current working directory (e.g., the project root)
        local parent_dir = vim.fn.expand("%:p:h")  -- Get the parent directory of the current file

        -- Compute the relative path from cwd to parent_dir
        local relative_path = string.sub(parent_dir, #cwd + 1)  -- Remove the cwd prefix
        if string.sub(relative_path, 1, 1) == "/" then
            relative_path = "." .. relative_path  -- Prepend './' if the path starts with '/'
        end

        -- Construct the command and run it
        local cmd = "kustomize build " .. parent_dir
        local output = vim.fn.systemlist(cmd)

        if vim.v.shell_error ~= 0 then
            vim.notify("Error: Could not run kustomize build", vim.log.levels.ERROR)
            return
        end

        -- Call floating_doc_window
        floating_doc_window({
            output = output,
            args = opts.args,
            name = "# Kustomize Build: " .. relative_path,
            filetype = "yaml",
        })
    end, { nargs = "?" })
end

return M

