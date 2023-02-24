require("lualine").setup({
    options = {
        theme = "auto",  -- 跟随主题
        component_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '' },
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            winbar = {},
        },
        ignore_focus = {},
    },
    extensions = { "nvim-tree", "toggleterm", "symbols-outline"},
    sections = {
        lualine_c = {
            {
                "filename",
                -- "buffers",
            },
        },
        lualine_x = {
            {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = { fg = require("core.color").pink },
            },
            --"filesize",
            --"hostname",
            {
                "fileformat",
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
                color = { fg = require("core.color").light },
            },
            {
                "encoding",
                color = { fg = require("core.color").indigo },
            },
            {
                "filetype",
                color = { fg = require("core.color").green },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {
            --{
            --"fileformat",
            --[[ symbols = {
                unix = '', -- e712
                dos = '', -- e70f
                mac = '', -- e711
            }, ]]
            --symbols = {
            --unix = "LF",
            --dos = "CRLF",
            --mac = "CR",
            --},
            --},
            --"encoding",
            "filetype",
        },
        lualine_y = {},
        lualine_z = {}
    },
})
