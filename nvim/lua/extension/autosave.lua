--
local filters = require('autosave.filters')
-- Available filters:
-- filters.opt 
-- filters.not_empty 
-- filters.modifiable 
-- filters.writeable 
-- filters.modified 
-- filters.filetype 
-- filters.custom 
-- Each filter has luadoc to describe its functionality and usage.
require('autosave').setup({
    events = {
        register = true, -- Should autosave register its autocommands
        triggers = { -- The autocommands to register, if enabled
            'InsertLeave', 'TextChanged'
        }
    },
    debounce = {
        enabled = true, -- Should debouncing be enabled
        delay = 250 -- If enabled, only save the file at most every `delay` ms
    },
    filters = { -- The filters to apply, see above for all options.
        filters.writeable,
        filters.not_empty,
        filters.modified,
    },
    hooks = {
        on_enable = nil,  -- Called when the plugin is enabled for the first time.
        pre_write = nil,  -- Called before the write sequence begins. (This happens before filter checks)
        post_write = nil, -- Called after the write sequence. (This happens after the buffer has been saved)
    }
})
