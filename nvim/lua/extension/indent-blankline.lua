-- 默认涂色
require("indent_blankline").setup {
    show_end_of_line = true,
}

require('mini.indentscope').setup({
    -- Options which control scope computation
    options = {
        try_as_border = true,
    },
})
vim.b.miniindentscope_disable = true
