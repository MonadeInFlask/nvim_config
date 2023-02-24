-- 颜色基础
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 主题
require("tokyonight").setup({
    style = "moon",
    dim_inactive = true,
    lualine_bold = true,
})
vim.cmd("colorscheme " .. "tokyonight")
-- tokyonight-moon 颜色表
local colors = {
	background = "#222436",
	foreground = "#c8d3f5",
	dark = "#1e2030",
	red = "#ff757f",
	green = "#c3e88d",
	orange = "ffc777",
	blue = "#82aaff",
	purple = "#c099ff",
	light = "#86e1fc",
	indigo = "#4fd6be",
    pink = "#fca7ea",
}
-- CursorLine
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = colors.background, fg = colors.light })
-- IndentLine
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { bg = colors.background, fg = colors.light })
-- telescope
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = colors.background, fg = colors.indigo })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = colors.background, fg = colors.indigo })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { bg = colors.background, fg = colors.indigo })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.background, fg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = colors.background, fg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = colors.background, fg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = colors.background })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = colors.background, fg = colors.purple })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = colors.background, fg = colors.purple })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = colors.background })
-- floaterm
vim.api.nvim_set_hl(0, "FloatermBorder", { bg = colors.background, fg = colors.blue })
vim.api.nvim_set_hl(0, "Floaterm", { bg = colors.background })
-- 补全
vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.background, fg = colors.blue })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3654a7" })
vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { bg = colors.background, fg = colors.purple })
return colors
