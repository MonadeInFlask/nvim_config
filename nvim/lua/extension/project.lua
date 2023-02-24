--
local project = require("project_nvim")
-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
	detection_methods = { "pattern" },
	patterns = {
		".git",
		"Makefile",
		"README.md",
		"truffle-config.js",
		"Cargo.toml",
		"Move.toml",
		"LICENSE",
	},
})

local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end
pcall(telescope.load_extension, "projects")
