require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "cmake",
        "pyright",
        "tsserver",
        "html",
        "cssls",
        "jsonls",
        "move_analyzer",
    },
})
require("mason").setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
