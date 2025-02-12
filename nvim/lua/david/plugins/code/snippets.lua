return {
  "L3MON4D3/LuaSnip",
  config = function()
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      local ls = require("luasnip")
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
      end
    end, { silent = true })
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/david/plugins/code/snippets" })
  end
}
