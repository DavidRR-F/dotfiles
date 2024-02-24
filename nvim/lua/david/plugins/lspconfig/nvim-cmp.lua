return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		{
			"onsails/lspkind-nvim",
			config = function()
				require("lspkind").init({})
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			snippets = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						buffer = "[Buffer]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})
	end,
}
