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

    -- Prepare header
    local header = (opts.name or "Output")
    local width = math.floor(vim.o.columns * 0.8)
    local centered_header = string.format("%s%s", string.rep(" ", math.floor((width - #header) / 2)), header)

    -- Create buffer and set content
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 1, -1, false, opts.output)
    vim.api.nvim_buf_set_option(buf, "filetype", opts.filetype or "text")
    vim.cmd("setlocal syntax=" .. opts.filetype)
    vim.api.nvim_buf_set_virtual_text(buf, 0, 0, { { centered_header, "Comment" } }, {})



    -- Set buffer to read-only mode
    vim.api.nvim_buf_set_option(buf, "readonly", true)  -- Make buffer read-only
    vim.api.nvim_buf_set_option(buf, "modified", false)  -- Ensure buffer is not marked as modified

    -- Disable editing commands (optional)
    vim.api.nvim_buf_set_keymap(buf, "n", "i", "<Nop>", { noremap = true, silent = true })  -- Disable insert mode
    vim.api.nvim_buf_set_keymap(buf, "n", "a", "<Nop>", { noremap = true, silent = true })  -- Disable append mode
    vim.api.nvim_buf_set_keymap(buf, "n", "o", "<Nop>", { noremap = true, silent = true })  -- Disable open new line
    vim.api.nvim_buf_set_keymap(buf, "n", "O", "<Nop>", { noremap = true, silent = true })  -- Disable open new line above

    local height = math.floor(vim.o.lines * 0.8)
    local win_opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = "rounded",
    }

    -- Open window
    local win = vim.api.nvim_open_win(buf, true, win_opts)

    -- Add keymap for closing the window
    vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<Cmd>close<CR>", { noremap = true, silent = true })
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
            name = "Kustomize Build: " .. relative_path,
            filetype = "yaml",
        })
    end, { nargs = "?" })
end

return M

