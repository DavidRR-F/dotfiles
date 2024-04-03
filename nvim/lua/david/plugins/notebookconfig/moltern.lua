return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "willothy/wezterm.nvim", config = true },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "wezterm.nvim"
            vim.g.molten_output_win_max_height = 20
        end,
        config = function()
            vim.api.nvim_set_hl(0, "MoltenOutputBorder", { fg = '#ff0000', bg = '#000000' })
            vim.api.nvim_set_hl(0, "MoltenOutputBorderFail", { link = 'Error' })
            vim.api.nvim_set_hl(0, "MoltenOutputBorderSuccess", { fg = '#00ff00' })
            vim.api.nvim_set_hl(0, "MoltenOutputWin", { bg = '#222222' })
            vim.api.nvim_set_hl(0, "MoltenOutputWinNC", { link = 'NormalNC' })
            vim.api.nvim_set_hl(0, "MoltenOutputFooter", { fg = '#aaaaaa', bg = '#333333' })
            vim.api.nvim_set_hl(0, "MoltenCell", { bg = '#1c1c1c' })
            vim.api.nvim_set_hl(0, "MoltenVirtualText", { fg = '#757575' })        
        end,
    } 
}
