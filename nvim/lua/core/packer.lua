-- 插件列表
local packer = require("packer")
packer.startup({
    function(use)
        -- Packer
        use("wbthomason/packer.nvim")
	    -- colortheme
        use 'folke/tokyonight.nvim'
        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline
        use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
        use("moll/vim-bbye")
        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        -- terminal
        use 'voldikss/vim-floaterm'
        -- dashboard-nvim
        use("glepnir/dashboard-nvim")
        -- telescope
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        -- project
        use("ahmedkhalf/project.nvim")
        -- treesitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        use('p00f/nvim-ts-rainbow')
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        -- symbols-outline
        use 'simrat39/symbols-outline.nvim'
        -- autopairs
        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }
        -- indent-blankline
        use("lukas-reineke/indent-blankline.nvim")
        use 'echasnovski/mini.indentscope'
        -- 动画
        use 'echasnovski/mini.animate'
        -- Comment
        use("numToStr/Comment.nvim")
        -- surround
        use("ur4ltz/surround.nvim")
        -- multi-cursor
        use('mg979/vim-visual-multi')
        -- autosave
        use({"nullishamy/autosave.nvim",})
        -- whichKey
        use('folke/which-key.nvim')
        -- noice
        use({
            "folke/noice.nvim",
            requires = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            }
        })
        -- repeat
        use('tpope/vim-repeat')
        -- leap
        use({"ggandor/leap.nvim"})
        use('ggandor/flit.nvim')
         -- git
        use({ "lewis6991/gitsigns.nvim" })
        ------------------------ 语言相关 ------------------------------
        -- mason
        use('williamboman/mason.nvim')
        use('williamboman/mason-lspconfig.nvim')
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        -- 补全ui 
        use("onsails/lspkind-nvim")
        -- null_ls
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -- trouble message
        use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }
        -- move语法高亮
        use("rvmelkonian/move.vim")
    end,

    config = {
        -- 并发数限制
        max_jobs = 16,
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
