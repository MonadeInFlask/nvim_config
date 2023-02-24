-- 基础核心设置
require("core.basic") -- 基础设置
require("core.keybindings") -- 按键设置
require("core.color") -- color
require("core.packer") -- Packer插件管理
require("core.autocmd") -- 自动执行
-- 扩展功能设置
require("extension.nvim-tree") -- 文件树
require("extension.bufferline") -- 标签栏
require("extension.lualine") -- 状态栏
require("extension.symbols-outline") -- 代码大纲
require("extension.floaterm") -- 终端
require("extension.telescope") -- 模糊搜索
require("extension.dashboard") -- 启动界面
require("extension.project") -- 项目管理服务
require("extension.noice") -- 信息处理
require("extension.indent-blankline") -- 作用域连接线
require("extension.comment") -- 块注释
require("extension.autopairs") -- 括号补全
require("extension.autosave") -- 自动保存
require("extension.surround") -- 环绕更改
require("extension.multi_cursor") -- 多光标 > todo
require("extension.nvim-treesitter") -- 统一语法高亮
require("extension.leap") -- 代码跳跃
require("extension.animate") -- UI动画效果
require("extension.repeat") -- 重复指令> todo
require("extension.which_key") -- 按键提示> todo
require("extension.gitsigns") -- git标志
-- 语言功能 
require("language.lspconfig") -- 不同语言设置 
require("language.mason") -- 安装器
require("language.cmp") -- 补全设置
require("language.sign") -- 编译标识
require("language.trouble") -- trouble列表
require("language.null_ls") -- 语言功能注入

if vim.g.neovide then   -- neovide
    vim.opt.guifont = {"FiraCode Nerd Font", ":h12"}
	vim.g.neovide_cursor_vfx_mode = "ripple"
end
