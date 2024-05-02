require("david.core")
require("david.lazy")
vim.g.python3_host_prog = vim.fn.expand('$HOME/.pyenv/versions/neovim3/bin/python')
vim.api.nvim_create_autocmd("User", {
    pattern = "VenvSelectPost",
    callback = function()
        require("david.plugins.lang.python").update_venv()
    end
})
