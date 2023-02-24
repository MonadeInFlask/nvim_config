--
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
---------------基础配置------------------------------------------
-- 窗口设置
-- 关闭当前
map("n", "<A-c>", "<C-w>c", opt)
-- 窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
-- 左右上下比例控制
map("n", "<A-d>", ":vertical resize -5<CR>", opt)
map("n", "<A-a>", ":vertical resize +5<CR>", opt)
map("n", "<A-w>", ":resize +5<CR>", opt)
map("n", "<A-s>", ":resize -5<CR>", opt)
-- 等比例
map("n", "<A-=>", "<C-w>=", opt)
-- 清空高亮
map("n", "<C-l>", ":noh<CR>", opt)
-- terminal相关
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- visual模式下代码块移动
map("v", "H", "<gv", opt)
map("v", "L", ">gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- 在visual mode 替代性粘贴, vim里的删除会复制
map("v", "p", '"_dP', opt)
------------------插件配置--------------------------------------
local pluginKeys = {}
-- 配置nvim-tree
-- M键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "" },
}

-- bufferline配置
map("n", "<C-j>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<C-k>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<C-c>", "<Cmd>Bdelete!<CR>", opt)

-- terminal
map("n", "<space>t", ":FloatermToggle<CR>", opt)

-- 配置大纲
map("n", "<A-o>", ":SymbolsOutline<CR>", opt)

-- treesitter 折叠
map("n", "zc", ":foldclose<CR>", opt)
map("n", "zo", ":foldopen<CR>", opt)

-- 搜索工程
map("n", "<space>ep", ":Telescope projects<CR>", opt)
-- 搜索最近文件
map("n", "<space>eo", ":Telescope oldfiles<CR>", opt)
-- 修改查看工程目录
map("n", "<space>eh", ":edit ~/.local/share/nvim/project_nvim/project_history<CR>", opt)
-- neovim设置
map("n", "<space>es", ":edit ~/.config/nvim/init.lua<CR>", opt)

-- 配置Telescope
-- 查找文件
map("n", "<space>f", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<space>g", ":Telescope live_grep<CR>", opt)
-- 代替原生查找
map("n", "<space>c", ":Telescope current_buffer_fuzzy_find<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go definition
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    -- go hover	
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	-- go references
	-- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	mapbuf("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opt)
    -- go declaration
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- go implementation
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { auync = true } <CR>", opt)
end
-- 格式化当前目录所有solidity文件
map("n", "<leader>ff", ":!npx prettier --write ./**/*.sol<CR>", opt)

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- 自定义代码段跳转到下一个参数
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),
		-- 自定义代码段跳转到上一个参数
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

-- Trouble
map("n", "<A-t>", ":TroubleToggle<CR>", opt)

-- comment快捷键
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		block = "gbc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		bock = "gb",
	},
}

pluginKeys.symbols_outline = {
	-- These keymaps can be a string or a table for multiple keys
	close = { "<Esc>", "q" },
	goto_location = "<Cr>",
	focus_location = "o",
	hover_symbol = "<C-space>",
	toggle_preview = "K",
	rename_symbol = "r",
	code_actions = "a",
	fold = "h",
	unfold = "l",
	fold_all = "W",
	unfold_all = "E",
	fold_reset = "R",
}

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", "<leader>gj", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	map("n", "<leader>gk", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
	map("n", "<leader>gS", gs.stage_buffer)
	map("n", "<leader>gu", gs.undo_stage_hunk)
	map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
	map("n", "<leader>gR", gs.reset_buffer)
	map("n", "<leader>gp", gs.preview_hunk)
	map("n", "<leader>gb", function()
		gs.blame_line({ full = true })
	end)
	map("n", "<leader>gd", gs.diffthis)
	map("n", "<leader>gD", function()
		gs.diffthis("~")
	end)
	-- toggle
	map("n", "<leader>gtd", gs.toggle_deleted)
	map("n", "<leader>gtb", gs.toggle_current_line_blame)
	-- Text object
	map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

return pluginKeys
