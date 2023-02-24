--
local cmp = require("cmp")

cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
	-- 补全源
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- For vsnip users.
		{ name = "vsnip" },
		{ name = "buffer" },
		-- For luasnip users.
		-- { name = 'luasnip' },
		--For ultisnips users.
		-- { name = 'ultisnips' },

		-- -- For snippy users.
		-- { name = 'snippy' },
	}, { name = "path" }),
	window = {
		completion = {
			border = { '╭','─','╮','│','╯','─','╰','│' },
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			scrolloff = 0,
			col_offset = 0,
			side_padding = 1,
			scrollbar = false,
		},
		documentation = {
			max_height = math.floor(40 * (40 / vim.o.lines)),
			max_width = math.floor((40 * 2) * (vim.o.columns / (40 * 2 * 16 / 9))),
			border = { '╭','─','╮','│','╯','─','╰','│' },
			winhighlight = "FloatBorder:CmpDocumentationBorder",
		},
	},
	-- 快捷键设置
	mapping = require("core.keybindings").cmp(cmp),
	-- 使用lspkind-nvim显示类型图标
	formatting = require("language.sign").formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
