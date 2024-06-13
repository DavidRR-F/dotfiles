return {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
        local worktree = require("git-worktree")
        local function handle_worktree_change(op, metadata)
            if op == worktree.Operations.Switch then
                vim.g.last_worktree_path = metadata.path
                print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
            end
        end
        worktree.setup()
        worktree.on_tree_change(handle_worktree_change)
    end,
}

