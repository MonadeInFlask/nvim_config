--
require("telescope").setup({
    defaults = {
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
            bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "top"
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.5
            },
            cursor = {
                height = 0.4,
                preview_cutoff = 40,
                width = 0.8
            },
            horizontal = {
                height = 0.9,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.8
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.8
            },
        },
        mappings = require("core.keybindings").telescopeList,
        prompt_prefix = '  ',
        initial_mode = 'insert',
        border = true,
    },
    pickers = {
        -- 内置 pickers 配置
        live_grep = {
            theme = "ivy",
        },
        current_buffer_fuzzy_find = {
            theme = "ivy",
        },
    },
    extensions = {
        -- 扩展插件配置
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case,the default case_mode is "smart_case"
        }
    },
})

require('telescope').load_extension('fzf')
