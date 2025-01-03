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
    
    {'neoclide/coc.nvim', branch = 'release'},
    
    {         
        'nvim-treesitter/nvim-treesitter',
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

    'chikko80/error-lens.nvim',

    'octol/vim-cpp-enhanced-highlight',

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    'ThePrimeagen/harpoon',

    -- {
    --   "startup-nvim/startup.nvim",
    --    config = function()
    --     require"startup".setup()
    --    end
    -- }
    
    'simrat39/rust-tools.nvim',

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
})

require("config")
