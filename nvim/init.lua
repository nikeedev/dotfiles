-- Example using a list of specs with the default options
vim.g.mapleader = "." -- Make sure to set `mapleader` before lazy so your mappings are correct


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',

    'ryanoasis/vim-devicons',
    'pangloss/vim-javascript',
    'honza/vim-snippets',
    'morhetz/gruvbox',
    'universal-ctags/ctags',
    'tommcdo/vim-lion',
    'tpope/vim-surround',
    
    {         
        'nvim-treesitter/nvim-treesitter',
        prefer_git = false,
        config = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    },

    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    

    'ollykel/v-vim',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { 'nvim-lua/plenary.nvim' }
    },

    'octol/vim-cpp-enhanced-highlight',

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    'ThePrimeagen/harpoon',
    
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    -- Completion framework:
    'hrsh7th/nvim-cmp',

    -- LSP completion source:
    'hrsh7th/cmp-nvim-lsp',
 
    -- Useful completion sources:
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip',

    {
        'folke/todo-comments.nvim',
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- 'dense-analysis/ale',

    'mbbill/undotree',
    
    "numToStr/FTerm.nvim",

    {
        'saecki/crates.nvim', tag = 'v0.4.0'
    },

    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end
    },
<<<<<<< HEAD
    
    { 'glacambre/firenvim', build = ":call firenvim#install(0)" },
=======

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }

>>>>>>> 650401f7e7e7122f90810743da2b0bcd4e868cd8
})

require("config")
