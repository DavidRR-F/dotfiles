return {
  "L3MON4D3/LuaSnip",
  config = function()
    vim.keymap.set({ "i", "s" }, "<C-f>", function()
      local ls = require("luasnip")
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/david/plugins/code/snippets" })
  end
}
