local db = require("dashboard")
db.setup({
    theme = 'doom',
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    },
    config = {
        header = {
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[  ▄█  ███▄▄▄▄      ▄████████  ▄█  ███▄▄▄▄    ▄█      ███        ▄████████   ]],
            [[ ███  ███▀▀▀██▄   ███    ███ ███  ███▀▀▀██▄ ███  ▀█████████▄   ███    ███   ]],
            [[ ███▌ ███   ███   ███    █▀  ███▌ ███   ███ ███▌    ▀███▀▀██   ███    █▀    ]],
            [[ ███▌ ███   ███  ▄███▄▄▄     ███▌ ███   ███ ███▌     ███   ▀  ▄███▄▄▄       ]],
            [[ ███▌ ███   ███ ▀▀███▀▀▀     ███▌ ███   ███ ███▌     ███     ▀▀███▀▀▀       ]],
            [[ ███  ███   ███   ███        ███  ███   ███ ███      ███       ███    █▄    ]],
            [[ ███  ███   ███   ███        ███  ███   ███ ███      ███       ███    ███   ]],
            [[ █▀    ▀█   █▀    ███        █▀    ▀█   █▀  █▀      ▄████▀     ██████████   ]],
            [[]],
            [[    ▄██████▄     ▄████████    ▄████████ ████████▄     ▄████████ ███▄▄▄▄     ]],
            [[   ███    ███   ███    ███   ███    ███ ███   ▀███   ███    ███ ███▀▀▀██▄   ]],
            [[   ███    █▀    ███    ███   ███    ███ ███    ███   ███    █▀  ███   ███   ]],
            [[  ▄███          ███    ███  ▄███▄▄▄▄██▀ ███    ███  ▄███▄▄▄     ███   ███   ]],
            [[ ▀▀███ ████▄  ▀███████████ ▀▀███▀▀▀▀▀   ███    ███ ▀▀███▀▀▀     ███   ███   ]],
            [[   ███    ███   ███    ███ ▀███████████ ███    ███   ███    █▄  ███   ███   ]],
            [[   ███    ███   ███    ███   ███    ███ ███   ▄███   ███    ███ ███   ███   ]],
            [[   ████████▀    ███    █▀    ███    ███ ████████▀    ██████████  ▀█   █▀    ]],
            [[                            ███    ███                                      ]],
            [[]],
            [[]],
            [[]],
            [[]],
        },

        center = {
            {
                icon = "  ",
                icon_hl = 'Title',
                desc = "Recently Projects                    ",
                desc_hl = 'String',
                key = 'ep',
                key_hl = 'Number',
                keymap = "SPC",
                action = "Telescope projects",
            },
            {
                icon = "  ",
                icon_hl = 'Title',
                desc = "Recently Files                       ",
                desc_hl = 'String',
                key = 'eo',
                key_hl = 'Number',
                keymap = "SPC",
                action = "Telescope oldfiles",
            },
            {
                icon = "  ",
                icon_hl = 'Title',
                desc = "Edit Project Roots                   ",
                desc_hl = 'String',
                key = 'eh',
                key_hl = 'Number',
                keymap = "SPC",
                action = "edit ~/.local/share/nvim/project_nvim/project_history",
            },
            {
                icon = "  ",
                icon_hl = 'Title',
                desc = "Neovim Settings                      ",
                desc_hl = 'String',
                key = 'es',
                key_hl = 'Number',
                keymap = "SPC",
                action = "edit ~/.config/nvim/init.lua",
            },
        },
        footer = {
            "",
            "",
            "",
            "",
            "To see a world in a grain of sand,",
            "  And a heaven in a wild flower. ",
        }
    },
})