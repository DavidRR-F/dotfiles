return {
 name = {
  lsp = "lua_ls"
 },
 lsp = {
   settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim", "Snacks", "LazyVim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.stdpath("config") .. "/lua",
          },
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = true,
        },
      },
    }
  }
}
