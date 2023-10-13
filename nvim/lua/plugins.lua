return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use 'ryanoasis/vim-devicons'
    use 'pangloss/vim-javascript'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'morhetz/gruvbox'
    use 'universal-ctags/ctags'
    use 'tommcdo/vim-lion'
    use 'tpope/vim-surround'
    
    use {'neoclide/coc.nvim', branch = 'release'}
    
    use {                                                           
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    use { 'ctrlpvim/ctrlp.vim' } -- fuzzy find files
    use { 'ollykel/v-vim' } 

    use {
        'chikko80/error-lens.nvim',
        requires = { 'nvim-telescope/telescope.nvim' }
    }

    use { 'octol/vim-cpp-enhanced-highlight' }
    use { 'mhartington/formatter.nvim' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'jose-elias-alvarez/null-ls.nvim' }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use {
        'ThePrimeagen/harpoon'
    }

    use {
      "startup-nvim/startup.nvim",
       config = function()
        require"startup".setup()
       end
    }
    
    use 'simrat39/rust-tools.nvim'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'
 
    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'      

    use 'folke/todo-comments.nvim'

    use "numToStr/FTerm.nvim"
end)
