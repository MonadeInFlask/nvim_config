--
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
-- 附加回调函数
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- 绑定快捷键
	require("core.keybindings").mapLSP(buf_set_keymap)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lua语言配置
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- 使得插件可以被补全
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

-- hardhat团队solidity
configs.solidity_hardhat = {
	default_config = {
		cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
		filetypes = { "solidity" },
		root_dir = lspconfig.util.find_git_ancestor,
		single_file_support = true,
		on_attach = on_attach,
		capabilities = capabilities,
	},
}
lspconfig.solidity_hardhat.setup({})

-- 原先
--[[ lspconfig.solidity.setup({
    on_attach = on_attach, -- probably you will need this.
    capabilities = capabilities,
    single_file_support = true,
    -- filetypes = { 'solidity' },
    -- cmd = { 'solidity-ls', '--stdio' },
    -- root_dir = lspconfig.util.find_git_ancestor,
    settings = {
        -- example of global remapping
        solidity = { includePath = '', remapping = { ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/' } }
    },
}) ]]
-- c/c++语言配置
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- cmake语言配置
lspconfig.cmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- rust语言配置
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- python语言配置
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- move语言配置
lspconfig.move_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- ts js语言配置
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
