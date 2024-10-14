require("lazy").setup({
    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons"
    },

    "folke/tokyonight.nvim",
    { "catppuccin/nvim",      name = "catppuccin" },
    "theprimeagen/harpoon",
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    "nvim-treesitter/nvim-treesitter-context",
    { "akinsho/bufferline.nvim", version = "v3.*" },
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "ThePrimeagen/vim-be-good",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "windwp/nvim-autopairs",
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
        -- or                            , branch = "0.1.x",
        dependencies = "nvim-lua/plenary.nvim"
    },
    "BurntSushi/ripgrep",

    -- LSP plugins
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    "rafamadriz/friendly-snippets",

    -- Copilot
    "github/copilot.vim"
})
